;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

(require 'ox-publish)

(defun my-org-export-format-drawer (name content)
  (format
"<p>
    <a data-toggle=\"collapse\" href=\"#%s-collapse\" aria-controls=\"%s-collapse\">Code (click to show)</a>
</p>
<div class=\"collapse\" id=\"%s-collapse\">
    %s
</div>"
   name name name content))
(setq org-html-format-drawer-function 'my-org-export-format-drawer)
(setq org-export-html-coding-system 'utf-8-unix)


(setq org-publish-project-alist
      '(
	("org-notes"
	 :base-directory "/home/nicholas/Documents/analytica/_drafts/"
	 :base-extension "org"
	 :publishing-directory "/home/nicholas/Documents/analytica/_posts/"
	 :recursive t
	 :with-toc nil
	 :body-only t
	 :num nil
	 :html-doctype "html5"
	 :html-html5-fancy t
	 :with-drawers t
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 )
	("org-static"
	 :base-directory "/home/nicholas/Documents/analytica/_drafts/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	 :publishing-directory "/home/nicholas/Documents/analytica/public/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("org"
	 :components ("org-notes" "org-static"))
      ))



