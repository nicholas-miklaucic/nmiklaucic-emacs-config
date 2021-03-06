;;; helm-dash.el --- Offline documentation browser for +150 APIs using Dash docsets.  -*- lexical-binding: t; -*-
;; Copyright (C) 2013-2014  Raimon Grau
;; Copyright (C) 2013-2014  Toni Reina

;; Author: Raimon Grau <raimonster@gmail.com>
;;         Toni Reina  <areina0@gmail.com>
;;
;; URL: http://github.com/areina/helm-dash
;; Package-Version: 20171017.342
;; Version: 1.3.0
;; Package-Requires: ((helm "1.9.2") (cl-lib "0.5"))
;; Keywords: docs

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; Clone the functionality of dash using helm foundation.  Browse
;; documentation via dash docsets.
;;
;; M-x helm-dash
;; M-x helm-dash-at-point
;;
;; More info in the project site https://github.com/areina/helm-dash
;;
;;; Code:

(eval-when-compile (require 'cl))
(require 'cl-lib)
(require 'helm)
(require 'helm-multi-match)
(require 'json)
(require 'xml)
(require 'format-spec)


;;; Customize

(defgroup helm-dash nil
  "Search Dash docsets using helm."
  :prefix "helm-dash-"
  :group 'applications)

(defcustom helm-dash-docsets-path
  (let ((original-dash-path (expand-file-name "~/Library/Application Support/Dash/DocSets")))
    (if (and (string-equal system-type 'darwin)
             (file-directory-p original-dash-path))
        original-dash-path
      (expand-file-name "~/.docsets")))
  "Default path for docsets.
If you're setting this option manually, set it to an absolute
path.  You can use `expand-file-name' function for that."
  :set (lambda (opt val) (set opt (expand-file-name val)))
  :group 'helm-dash)

(defcustom helm-dash-docsets-url "https://raw.github.com/Kapeli/feeds/master"
  "Feeds URL for dash docsets." :group 'helm-dash)

(defcustom helm-dash-min-length 3
  "Minimum length to start searching in docsets.
0 facilitates discoverability, but may be a bit heavy when lots
of docsets are active.  Between 0 and 3 is sane."
  :group 'helm-dash)

(defcustom helm-dash-candidate-format "%d %n (%t)"
  "Format of the displayed candidates.
Available formats are
   %d - docset name
   %n - name of the token
   %t - type of the token
   %f - file name"
  :group 'helm-dash)

(defcustom helm-dash-enable-debugging t
  "When non-nil capture stderr from sql commands and display it in a buffer.
Setting this to nil may speed up queries."
  :group 'helm-dash)



(defvar helm-dash-history-input nil)
(defvar helm-dash-common-docsets
  '() "List of Docsets to search active by default.")


(defun helm-dash-docset-path (docset)
  "Return the full path of the directory for DOCSET."
  (let* ((base (helm-dash-docsets-path))
         (docdir (expand-file-name docset base)))
    (cl-loop for dir in (list (format "%s/%s.docset" base docset)
                              (format "%s/%s.docset" docdir docset)
                              (when (file-directory-p docdir)
                                (cl-first (directory-files docdir t "\\.docset\\'"))))
             when (and dir (file-directory-p dir))
             return dir)))

(defun helm-dash-docset-db-path (docset)
  "Compose the path to sqlite DOCSET."
  (let ((path (helm-dash-docset-path docset)))
    (if path
        (expand-file-name "Contents/Resources/docSet.dsidx" path)
      (error "Cannot find docset '%s' in `helm-dash-docsets-path'" docset))))

(defvar helm-dash-connections nil
  "List of conses like (\"Go\" . connection).")

(defcustom helm-dash-browser-func 'browse-url
  "Default function to browse Dash's docsets.
Suggested values are:
 * `browse-url'
 * `eww'"
  :group 'helm-dash)

(defun helm-dash-docsets-path ()
  "Return the path where Dash's docsets are stored."
  (expand-file-name helm-dash-docsets-path))

(defun helm-dash-sql (db-path sql)
  "Run in the db located at DB-PATH the SQL command and parse the results.
If there are errors, print them in `helm-dash-debugging-buffer'"
  (helm-dash-parse-sql-results
   (with-output-to-string
     (let ((error-file (when helm-dash-enable-debugging
                         (make-temp-file "helm-dash-errors-file"))))
       (call-process "sqlite3" nil (list standard-output error-file) nil
                     ;; args for sqlite3:
                     "-list" "-init" "''" db-path sql)

       ;; display errors, stolen from emacs' `shell-command` function
       (when (and error-file (file-exists-p error-file))
         (if (< 0 (nth 7 (file-attributes error-file)))
             (with-current-buffer (helm-dash-debugging-buffer)
               (let ((pos-from-end (- (point-max) (point))))
                 (or (bobp)
                     (insert "\f\n"))
                 ;; Do no formatting while reading error file,
                 ;; because that can run a shell command, and we
                 ;; don't want that to cause an infinite recursion.
                 (format-insert-file error-file nil)
                 ;; Put point after the inserted errors.
                 (goto-char (- (point-max) pos-from-end)))
               (display-buffer (current-buffer))))
         (delete-file error-file))))))

(defun helm-dash-parse-sql-results (sql-result-string)
  "Parse SQL-RESULT-STRING splitting it by newline and '|' chars."
  (mapcar (lambda (x) (split-string x "|" t))
          (split-string sql-result-string "\n" t)))

(defun helm-dash-filter-connections ()
  "Filter connections using `helm-dash-connections-filters'."
  (let ((docsets (helm-dash-buffer-local-docsets))
        (connections nil))
    (setq docsets (append docsets helm-dash-common-docsets))
    (delq nil (mapcar (lambda (y)
                        (assoc y helm-dash-connections))
             docsets))))

(defun helm-dash-buffer-local-docsets ()
  "Get the docsets configured for the current buffer."
  (or (and (boundp 'helm-dash-docsets) helm-dash-docsets)
      '()))

(defun helm-dash-create-common-connections ()
  "Create connections to sqlite docsets for common docsets."
  (when (not helm-dash-connections)
    (setq helm-dash-connections
          (mapcar (lambda (x)
                    (let ((db-path (helm-dash-docset-db-path x)))
                      (list x db-path (helm-dash-docset-type db-path))))
                  helm-dash-common-docsets))))

(defun helm-dash-create-buffer-connections ()
  "Create connections to sqlite docsets for buffer-local docsets."
  (mapc (lambda (x) (when (not (assoc x helm-dash-connections))
                 (let ((connection  (helm-dash-docset-db-path x)))
                   (setq helm-dash-connections
                         (cons (list x connection (helm-dash-docset-type connection))
                               helm-dash-connections)))))
        (helm-dash-buffer-local-docsets)))

(defun helm-dash-reset-connections ()
  "Wipe all connections to docsets."
  (interactive)
  (setq helm-dash-connections nil))

(defun helm-dash-docset-type (db-path)
  "Return the type of the docset based in db schema.
Possible values are \"DASH\" and \"ZDASH\".
The Argument DB-PATH should be a string with the sqlite db path."
  (let ((type_sql "SELECT name FROM sqlite_master WHERE type = 'table' LIMIT 1"))
    (if (member "searchIndex" (car (helm-dash-sql db-path type_sql)))
        "DASH"
      "ZDASH")))

(defun helm-dash-read-json-from-url (url)
  "Read and return a JSON object from URL."
  (with-current-buffer
      (url-retrieve-synchronously url)
    (goto-char url-http-end-of-headers)
    (json-read)))

(defun helm-dash-unofficial-docsets ()
  "Return a list of lists with docsets contributed by users.
The first element is the docset's name second the docset's archive url."
  (let ((user-docs (helm-dash-read-json-from-url
                    "https://dashes-to-dashes.herokuapp.com/docsets/contrib")))
    (mapcar (lambda (docset)
              (list
               (assoc-default 'name docset)
               (assoc-default 'archive docset)))
            user-docs)))

(defvar helm-dash-ignored-docsets
  '("Bootstrap" "Drupal" "Zend_Framework" "Ruby_Installed_Gems" "Man_Pages")
  "Return a list of ignored docsets.
These docsets are not available to install.
See here the reason: https://github.com/areina/helm-dash/issues/17.")

(defun helm-dash-official-docsets ()
  "Return a list of official docsets (http://kapeli.com/docset_links)."
  (let ((docsets (helm-dash-read-json-from-url
                  "https://api.github.com/repos/Kapeli/feeds/contents/")))
    (delq nil (mapcar (lambda (docset)
                        (let ((name (assoc-default 'name docset)))
                          (if (and (equal (file-name-extension name) "xml")
                                   (not
                                    (member (file-name-sans-extension name) helm-dash-ignored-docsets)))
                              (file-name-sans-extension name))))
                      docsets))))

(defun helm-dash-installed-docsets ()
  "Return a list of installed docsets."
  (let ((docset-path (helm-dash-docsets-path)))
    (cl-loop for dir in (directory-files docset-path nil "^[^.]")
             for full-path = (expand-file-name dir docset-path)
             for subdir = (and (file-directory-p full-path)
                               (cl-first (directory-files full-path t "\\.docset\\'")))
             when (or (string-match-p "\\.docset\\'" dir)
                      (file-directory-p (expand-file-name (format "%s.docset" dir) full-path))
                      (and subdir (file-directory-p subdir)))
             collecting (replace-regexp-in-string "\\.docset\\'" "" dir))))

(defun helm-dash-read-docset (prompt choices)
  "PROMPT user to choose one of the docsets in CHOICES.
Report an error unless a valid docset is selected."
  (let ((completion-ignore-case t))
    (completing-read (format "%s (%s): " prompt (car choices))
                     choices nil t nil nil choices)))

;;;###autoload
(defun helm-dash-activate-docset (docset)
  "Activate DOCSET.  If called interactively prompts for the docset name."
  (interactive (list (helm-dash-read-docset
                      "Activate docset"
                      (helm-dash-installed-docsets))))
  (add-to-list 'helm-dash-common-docsets docset)
  (helm-dash-reset-connections))

;;;###autoload
(defun helm-dash-deactivate-docset (docset)
  "Deactivate DOCSET.  If called interactively prompts for the docset name."
  (interactive (list (helm-dash-read-docset
                      "Deactivate docset"
                      helm-dash-common-docsets)))
  (setq helm-dash-common-docsets (delete docset helm-dash-common-docsets)))

(defun helm-dash--install-docset (url docset-name)
  "Download a docset from URL and install with name DOCSET-NAME."
  (let ((docset-tmp-path (format "%s%s-docset.tgz" temporary-file-directory docset-name)))
    (url-copy-file url docset-tmp-path t)
    (helm-dash-install-docset-from-file docset-tmp-path)))

(defun helm-dash--ensure-created-docsets-path (docset-path)
  "Check if DOCSET-PATH directory exists.
If doesn't exist, it asks to create it."
  (or (file-directory-p docset-path)
      (and (y-or-n-p (format "Directory %s does not exist.  Want to create it? "
                             docset-path))
           (mkdir docset-path t))))


;;;###autoload
(defun helm-dash-install-user-docset (docset-name)
  "Download an unofficial docset with specified DOCSET-NAME and move its stuff to docsets-path."
  (interactive (list (helm-dash-read-docset
                      "Install docset"
                      (mapcar 'car (helm-dash-unofficial-docsets)))))
  (when (helm-dash--ensure-created-docsets-path (helm-dash-docsets-path))
    (helm-dash--install-docset (car (assoc-default docset-name (helm-dash-unofficial-docsets))) docset-name)))


;;;###autoload
(defun helm-dash-install-docset-from-file (docset-tmp-path)
  "Extract the content of DOCSET-TMP-PATH, move it to `helm-dash-docsets-path` and activate the docset."
  (interactive
   (list (car (find-file-read-args "Docset Tarball: " t))))
  (let ((docset-folder
         (helm-dash-docset-folder-name
          (shell-command-to-string
           (format "tar xvf %s -C %s"
                   (shell-quote-argument (expand-file-name docset-tmp-path))
                   (shell-quote-argument (helm-dash-docsets-path)))))))
    (helm-dash-activate-docset docset-folder)
    (message (format
              "Docset installed. Add \"%s\" to helm-dash-common-docsets or helm-dash-docsets."
              docset-folder))))

;;;###autoload
(defun helm-dash-install-docset (docset-name)
  "Download an official docset with specified DOCSET-NAME and move its stuff to docsets-path."
  (interactive (list (helm-dash-read-docset
                      "Install docset"
                      (helm-dash-official-docsets))))

  (when (helm-dash--ensure-created-docsets-path (helm-dash-docsets-path))
    (let ((feed-url (format "%s/%s.xml" helm-dash-docsets-url docset-name))
          (feed-tmp-path (format "%s%s-feed.xml" temporary-file-directory docset-name)))
      (url-copy-file feed-url feed-tmp-path t)
      (helm-dash--install-docset (helm-dash-get-docset-url feed-tmp-path) docset-name))))

;;;###autoload
(defun helm-dash-async-install-docset (docset-name)
  "Asynchronously download docset with specified DOCSET-NAME and move its stuff to docsets-path."
  (interactive (list (helm-dash-read-docset "Install docset" (helm-dash-official-docsets))))
  (when (helm-dash--ensure-created-docsets-path (helm-dash-docsets-path))
    (let ((feed-url (format "%s/%s.xml" helm-dash-docsets-url docset-name)))

      (message (concat "The docset \"" docset-name "\" will now be installed asynchronously."))

      (async-start ; First async call gets the docset meta data
       (lambda ()
         ;; Beware! This lambda is run in it's own instance of emacs.
         (url-file-local-copy feed-url))
       (lambda (filename)
         (let ((docset-url (helm-dash-get-docset-url filename)))
           (async-start     ; Second async call gets the docset itself
            (lambda ()
              ;; Beware! This lambda is run in it's own instance of emacs.
              (url-file-local-copy docset-url))
            (lambda (docset-tmp-path)
              (helm-dash-async-install-docset-from-file docset-tmp-path)))))))))

;;;###autoload
(defun helm-dash-async-install-docset-from-file (docset-tmp-path)
  "Asynchronously extract the content of DOCSET-TMP-PATH, move it to `helm-dash-docsets-path` and activate the docset."
  (interactive (list (car (find-file-read-args "Docset Tarball: " t))))
  (let ((docset-tar-path (expand-file-name docset-tmp-path))
        (docset-out-path (helm-dash-docsets-path)))
    (async-start
     (lambda ()
       ;; Beware! This lambda is run in it's own instance of emacs.
       (shell-command-to-string
        (format "tar xvf %s -C %s"
                (shell-quote-argument docset-tar-path)
                (shell-quote-argument docset-out-path))))
     (lambda (shell-output)
       (let ((docset-folder (helm-dash-docset-folder-name shell-output)))
         (helm-dash-activate-docset docset-folder)
         (message (format
                   "Docset installed. Add \"%s\" to helm-dash-common-docsets or helm-dash-docsets."
                   docset-folder)))))))

(defalias 'helm-dash-update-docset 'helm-dash-install-docset)

(defun helm-dash-docset-installed-p (docset)
  "Return true if DOCSET is installed."
  (member docset (helm-dash-installed-docsets)))

;;;###autoload
(defun helm-dash-ensure-docset-installed (docset)
  "Install DOCSET if it is not currently installed."
  (unless (helm-dash-docset-installed-p docset)
    (helm-dash-install-docset docset)))

(defun helm-dash-docset-folder-name (tar-output)
  "Return the name of the folder where the docset has been extracted.
The argument TAR-OUTPUT should be an string with the output of a tar command."
  (let ((last-line
         (car (last (split-string tar-output "\n" t)))))
    (replace-regexp-in-string "^x " "" (car (split-string last-line "\\." t)))))

(defun helm-dash-get-docset-url (feed-path)
  "Parse a xml feed with docset urls and return the first url.
The Argument FEED-PATH should be a string with the path of the xml file."
  (let* ((xml (xml-parse-file feed-path))
         (urls (car xml))
         (url (xml-get-children urls 'url)))
    (cl-caddr (cl-first url))))

(defvar helm-dash-sql-queries
  '((DASH . (lambda (pattern)
              (let ((like (helm-dash-sql-compose-like "t.name" pattern))
                    (query "SELECT t.type, t.name, t.path FROM searchIndex t WHERE %s ORDER BY LENGTH(t.name), LOWER(t.name) LIMIT 1000"))
                (format query like))))
    (ZDASH . (lambda (pattern)
               (let ((like (helm-dash-sql-compose-like "t.ZTOKENNAME" pattern))
                     (query "SELECT ty.ZTYPENAME, t.ZTOKENNAME, f.ZPATH, m.ZANCHOR FROM ZTOKEN t, ZTOKENTYPE ty, ZFILEPATH f, ZTOKENMETAINFORMATION m WHERE ty.Z_PK = t.ZTOKENTYPE AND f.Z_PK = m.ZFILE AND m.ZTOKEN = t.Z_PK AND %s ORDER BY LENGTH(t.ZTOKENNAME), LOWER(t.ZTOKENNAME) LIMIT 1000"))
                 (format query like))))))

(defun helm-dash-sql-compose-like (column pattern)
  "Return a query fragment for a sql where clause.
Search in column COLUMN by multiple terms splitting the PATTERN
by whitespace and using like sql operator."
  (let ((conditions (mapcar (lambda (word) (format "%s like '%%%s%%'" column word))
                            (split-string pattern " "))))
    (format "%s" (mapconcat 'identity conditions " AND "))))

(defun helm-dash-sql-query (docset-type pattern)
  "Return a SQL query to search documentation in dash docsets.
A different query is returned depending on DOCSET-TYPE.  PATTERN
is used to compose the SQL WHERE clause."
  (let ((compose-select-query-func
         (cdr (assoc (intern docset-type) helm-dash-sql-queries))))
    (when compose-select-query-func
      (funcall compose-select-query-func pattern))))

(defun helm-dash-maybe-narrow-docsets (pattern)
  "Return a list of helm-dash-connections.
If PATTERN starts with the name of a docset followed by a space, narrow the
 used connections to just that one.  We're looping on all connections, but it
 shouldn't be a problem as there won't be many."
  (let ((conns (helm-dash-filter-connections)))
    (or (cl-loop for x in conns
                 if (string-prefix-p
                     (concat (downcase (car x)) " ")
                     (downcase pattern))
                 return (list x))
        conns)))

(defun helm-dash-sub-docset-name-in-pattern (pattern docset-name)
  "Remove from PATTERN the DOCSET-NAME if this includes it.
If the search starts with the name of the docset, ignore it.
Ex: This avoids searching for redis in redis unless you type 'redis redis'"
  (replace-regexp-in-string
   (format "^%s " (regexp-quote (downcase docset-name)))
   ""
   pattern))

(defun helm-dash-search ()
  "Iterates every `helm-dash-connections' looking for the `helm-pattern'."
  (let ((connections (helm-dash-maybe-narrow-docsets helm-pattern)))
    (cl-loop for docset in connections
             append (cl-loop for row in (helm-dash--run-query docset helm-pattern)
                             collect (helm-dash--candidate docset row)))))

(make-obsolete #'helm-dash-search nil "1.3.0")

(defun helm-dash--run-query (docset search-pattern)
  "Execute an sql query in dash docset DOCSET looking for SEARCH-PATTERN.
Return a list of db results.  Ex:

'((\"func\" \"BLPOP\" \"commands/blpop.html\")
 (\"func\" \"PUBLISH\" \"commands/publish.html\")
 (\"func\" \"problems\" \"topics/problems.html\"))"
  (let ((docset-type (cl-caddr docset)))
    (helm-dash-sql
     (cadr docset)
     (helm-dash-sql-query docset-type
                          (helm-dash-sub-docset-name-in-pattern search-pattern
                                                                (car docset))))))

(defun helm-dash--candidate (docset row)
  "Return a list extracting info from DOCSET and ROW to build a helm candidate.
First element is the display message of the candidate, rest is used to build
candidate opts."
  (cons (format-spec helm-dash-candidate-format
                     (list (cons ?d (first docset))
                           (cons ?n (second row))
                           (cons ?t (first row))
                           (cons ?f (replace-regexp-in-string
                                     "^.*/\\([^/]*\\)\\.html?#?.*"
                                     "\\1"
                                     (third row)))))
        (list (car docset) row)))

(defun helm-dash-result-url (docset-name filename &optional anchor)
  "Return the full, absolute URL to documentation.
Either a file:/// URL joining DOCSET-NAME, FILENAME & ANCHOR with sanitization
 of spaces or a http(s):// URL formed as-is if FILENAME is a full HTTP(S) URL."
  (let* ((clean-filename (replace-regexp-in-string "<dash_entry_.*>" "" filename))
         (path (format "%s%s" clean-filename (if anchor (format "#%s" anchor) ""))))
    (if (string-match-p "^https?://" path)
        path
      (replace-regexp-in-string
       " "
       "%20"
       (concat
        "file:///"
        (expand-file-name "Contents/Resources/Documents/" (helm-dash-docset-path docset-name))
        path)))))

(defun helm-dash-browse-url (search-result)
  "Call to `browse-url' with the result returned by `helm-dash-result-url'.
Get required params to call `helm-dash-result-url' from SEARCH-RESULT."
  (let ((docset-name (car search-result))
        (filename (nth 2 (cadr search-result)))
        (anchor (nth 3 (cadr search-result))))
    (funcall helm-dash-browser-func (helm-dash-result-url docset-name filename anchor))))

(defun helm-dash-add-to-kill-ring (search-result)
  "Add to kill ring a formatted string to call `helm-dash-browse-url' with SEARCH-RESULT."
  (kill-new (format "(helm-dash-browse-url '%S)" search-result)))

(defun helm-dash-actions (actions doc-item)
  "Return an alist with the possible ACTIONS to execute with DOC-ITEM."
  `(("Go to doc" . helm-dash-browse-url)
    ("Copy to clipboard" . helm-dash-add-to-kill-ring)))

(defun helm-source-dash-search ()
  "Return an alist with configuration options for Helm."
  `((name . "Dash")
    (volatile)
    (delayed)
    (requires-pattern . ,helm-dash-min-length)
    (candidates-process . helm-dash-search)
    (persistent-help . "Show this doc")
    (action-transformer . helm-dash-actions)))

(make-obsolete #'helm-source-dash-search nil "1.3.0")

(defun helm-dash-debugging-buffer ()
  "Return the helm-dash debugging buffer."
  (get-buffer-create "*helm-dash-errors*"))

(defun helm-dash-initialize-debugging-buffer ()
  "Open debugging buffer and insert a header message."
  (with-current-buffer (helm-dash-debugging-buffer)
    (erase-buffer)
    (insert "----------------")
    (insert "\n HEY! This is helm-dash (sqlite) error logging. If you want to disable it, set `helm-dash-enable-debugging` to nil\n")
    (insert "---------------- \n\n")))

(defun helm-dash-build-source (docset)
  "Build a Helm source for DOCSET."
  (lexical-let ((docset docset))
    (helm-build-sync-source (car docset)
      :action-transformer #'helm-dash-actions
      :candidates (lambda ()
                    (cl-loop for row in (helm-dash--run-query docset helm-pattern)
                             collect (helm-dash--candidate docset row)))
      :volatile t
      :persistent-help "View doc"
      :requires-pattern helm-dash-min-length)))

(defun helm-dash-sources--narrowed-docsets ()
  "Return a list of Helm sources for narrowed docsets.

Narrowed docsets are those returned by
`helm-dash-maybe-narrow-docsets'."
  (let ((connections (helm-dash-maybe-narrow-docsets helm-pattern)))
    (cl-loop for docset in connections
             append (list (helm-dash-build-source docset)))))


;;; Autoloads

;;;###autoload
(defun helm-dash (&optional input-pattern)
  "Bring up a `helm-dash' search interface.
If INPUT-PATTERN is non-nil, use it as an initial input in helm search."
  (interactive)
  (helm-dash-initialize-debugging-buffer)
  (helm-dash-create-common-connections)
  (helm-dash-create-buffer-connections)
  (helm :sources (helm-dash-sources--narrowed-docsets)
        :buffer "*helm-dash*"
        :prompt "Doc for: "
        :history 'helm-dash-history-input
        :input input-pattern
        :helm-candidate-number-limit 1000))

;;;###autoload
(defun helm-dash-at-point ()
  "Bring up a `helm-dash' search interface with symbol at point."
  (interactive)
  (helm-dash
   (substring-no-properties (thing-at-point 'symbol))))


(provide 'helm-dash)

;;; helm-dash.el ends here
