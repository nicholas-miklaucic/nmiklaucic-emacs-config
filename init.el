;; setup packages
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(set-default-font "Fira Code Retina 12")
;; keybindings
(global-set-key [f1] 'shell)
(global-set-key [f10] 'magit-status)
(global-set-key (kbd "M-o") 'other-window)
;; magit
(add-to-list 'load-path "~/.emacs.d/lisp/magit/lisp")
(require 'magit)
(global-set-key (kbd "C-x C-e") 'eval-buffer)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-c f") 'helm-recentf)
(global-set-key (kbd "C-x C-r") 'recompile)

;; because I'm dumb
(global-set-key (kbd "C-z") 'undo)

;; taking care of fill stuff
(setq-default fill-column 100)
(add-hook 'prog-mode-hook 'auto-fill-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/.emacs.d/lisp/magit/Documentation/"))


;; this needs to be a thing
(global-set-key (kbd "C-c C-w") 'kill-region)

(use-package neotree
  :bind (([f8] . neotree-toggle))
  )

(use-package symon
  :init
  (symon-mode))

(use-package js-comint
  :config
  (setq inferior-js-program-command "node")
  (setq inferior-js-program-arguments '("--interactive"))
  (add-hook 'js2-mode-hook
	    (lambda ()
	      (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
	      (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
	      (local-set-key (kbd "C-c b") 'js-send-buffer)
	      (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)
	      (local-set-key (kbd "C-c l") 'js-load-file-and-go))))

;; wind-move
(windmove-default-keybindings)

;; because I use ` for a drop-down terminal (sometimes), set a global keybinding
(defun insert-backtick ()
  (interactive)
  (insert-char 96)
  )

(use-package sx
  :config
  (bind-keys :prefix "C-c s"
             :prefix-map my-sx-map
             :prefix-docstring "Global keymap for SX."
             ("q" . sx-tab-all-questions)
             ("i" . sx-inbox)
             ("o" . sx-open-link)
             ("u" . sx-tab-unanswered-my-tags)
             ("a" . sx-ask)
             ("s" . sx-search)))

(global-set-key (kbd "C-M-*") 'insert-backtick) 

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(global-set-key (kbd "C-c C-k") 'kill-other-buffers)

(use-package :visual-regexp-steroids
  :bind (("C-c r" . vr/replace)
	 ("C-c q" . vr/query-replace)
	 ("C-c m" . vr/mc-mark)
	 ("C-c C-r" . vr/isearch-backward)
	 ("C-c C-s" . vr/isearch-forward)))

;; avy
(use-package avy
  :init
  (avy-setup-default)
  (avy-flycheck-setup)

  :bind (("C-c a l" . avy-goto-line)
	 ("C-c a c" . avy-goto-char)
	 ("C-c a w" . avy-goto-word-1))
  )

;; (add-hook 'prog-mode-hook #'aggressive-indent-mode)
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#f8f8f8" "#ab4642" "#a1b56c" "#f7ca88" "#7cafc2" "#ba8baf" "#7cafc2" "#383838"])
 '(ansi-term-color-vector
   [unspecified "#f8f8f8" "#ab4642" "#a1b56c" "#f7ca88" "#7cafc2" "#ba8baf" "#7cafc2" "#383838"])
 '(company-ghc-show-info t)
 '(company-idle-delay 0.24)
 '(company-minimum-prefix-length 3)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("4e505bbcc13e7f71c08d1d4b38f1b9a79c3c022d29286131496f18114a736c6d" "d488bb901c4578835f0f6aaf5858d72f8559dfdf1b13167e3ef68440b705b18c" "8b3891e36ac5cba6c8ee627b887b746aeba59cb0f9926af391d8ddc375a448ed" "b771fe75973c77fd3fcfce7e15e6efa129d4bf1be5e1bfd70c77c58cfd763e49" "14a1fe55d12d04009ea224776cd900248c409366854d44930909b4c829a4aa2e" "0edfc747fdffa640d0dc61aa162c338b36bd12309d8c404e5c058671ede490ac" "7c74fb37ae732c4dd44e09e83199e103428785559e5246e0372354dedeea223a" "24ae9187b44915ed3f0c5250bcc37c7cc4a8fbbedae590d5a7355ee22c13ef26" "18ec8da0916b6c50e77a780935cd943e47fb704af5bbe1b684a48e08f53a25ea" "690c22737a5bfed64b7e5bbddbbaf418a58e95cda91c38d31e62db620a01cfea" "d34e21b41f7d2a83467efb8387e668f27ae892138941700cb5f43bc28e660f28" "a58490f1e8bfcd3dcc2b7792f512dd5377317a527054cb3a98d8f8ba5c093ca9" "3a77259991b9f471b964ba343d23e446f90994c1ec6c4d87903b4375c5617ee4" "8458a4027e83afdd143dddc99f6a05b5286fb70faea0ffa33d1486f0df5a2e45" "d1a6f0038bd1e28b9bf044436bf5724353c035b70852b743fd23cceef5622987" "a84c5f3f0e5ca07be7134ceff36dbee3a133793131302a91f9f2a9d22e0edf50" "722bd7f7eada0a9dbd9b82762fce51d206ef26778e5cb84a42f9da0a39a16e58" "c4b0409d023ec5dedee3a17294f3974442aafdc085aa7d831933a33bc09491f8" "228aa1bb04ae81033b877387c41be68a97933224aaeaf3e93350dfaa83bdbb11" "17700c88bb80d6e70b59567cdc29e7934214e13514065dcd704f55662cabb5d3" "ba3e4b37226e20ecef664248c7a8be4f65e0acada44b6f3aa027357a8209cb83" "c7ee2db2dcc256ac63362c1488ed5c6aa055321b99a31008c523b976f7e627e6" "2439e8dee861cab8135be33b58be36d59e087c2faad7614a2e67208e3c161bfb" "0d82d24e22323a9590ee44eb0083e226afe8a06c9b710f939b7c9439ff7c9c0c" "3121f2c7e3ba222b1b8ab4bfa91bbaea02b54ad28febc2ebcf470d07941b1d91" "91627d5eb3c7387b59e763f69fa35246ace25b8865ff0dbfc026e5a98fc76de6" "884798700d1f119b539a6c1f729f12b3119c2f024727bf92e1f561d824409100" "c330a42a6bcf5e1ba29b87445ce4633da18278e26798416758cb3de40a6e45a4" "3ddc83862f510d29276b5ca01b7bc8bf6ecefb43d62ada2942619a2299a11b09" "7bc19d0b9ae1b47acf7d3b783851f041c3a9dc39a47fefd4d2d01724d9b28876" "9a302f02b66a2c973b2e5f1d5ca544146aa8fe78486e4ba60fa76d8f6380063e" "8b2c60ca860767a97698fb3bf7b846495b6bad121cf11cc2848354071495c3cb" "2fb3e45c04af37fffc8f4f50c75440296adaac58ba4f446f55e99b2c3894acb6" "fb3afb9343867cdd790d0746c73a15d823c869f11218534615851357204a882b" "e125572d59d54afa9d223e449c83bf4c41a24b2e8151fc7640b16917d01fa728" "e8a54c337665b4753b8e7ffd3a390483235b393ac88e374a84b3d26c9458da15" "7d8374b779fd04af3fb6840a82c13c6951340c0abb9185dc02936d5fc331024d" "aa12adf4a3c5a2704e601e17633e813e88d3b5fd79773a0fd6a689db1e763d47" "f3b33467bc4067b7059a915e25a7bd0161ed4b79f39299414a0795e2ecd53b45" "c17716410de373d222b6f28843c3ec9c8c9f5f5439a54862e73d164030ab80df" "2ca8acba534ae969a00422589354b3dde944b57810cc189efaa5eea480341583" "f5574fabdcf5b3afdf2b83ae69a3ad74eba6765842284d4bd5876479900063e8" "59a8cf08d6d7bf0eb63c320f58b1cb33889b49eb84d374d7b625bc123fcc6bb9" "f6c2aebefe4472b2cdaf879c2cc87b8e12a58a18c92de8ff557a2bff5d6b3686" "a243300f967e10fcc0388bc00ebdfaa60198ab6fb792c3e155153a13951a85eb" "c2c0359650698295b0602d0aa8cbfdada498c94be4ecdc1df2b4195c67cb202c" "f96d9ae84da9e8e85fe405ed1bbfbea0a79380e949d3c9295d255fbda891d729" "e95270062d22844cf3c40d1bae7b901051d2a98ed1614b1712cd7250966366a1" "3b56a9cf229b0d580a9af5ebe6c91d3ceaba5cf94d13f3f2de5892da7cec371a" "d200eaaa874271aa78085c0495b71057e6b5268ae59a2106cceb36fb9347fc49" "d0309ea145176b5025ce30cfe1d13d9a923e10118ee3a40fefe398c96bc6824f" "1fd24f198b08daf706397b37be2f6ddf76d5bac4f2d90cf9b46d11ec499bec4c" "d0748ac0934177d6edc6f8082f755b932af94e7319dcc64745fd4d08e71c7b47" "f2abd6b02a0c84b89f88497b5d86c05c465fa9f6c645549233839bc0d1ac40cd" "734319755574ffcbfd988cbb04c5fb47d5aaf5da41586059d09437702300d876" "44cd1b43460efa89e45b1d6c506fa462cc568750051de8292bfb9f24480991b7" "32202c5b0289ad52048c5e8080e46f83628904bf25406e87c5b324c70bc56204" "ea12db4cb6494716c8eb70f4926db5e40ba9530c1ef7cb5d1f09bb8a691154c7" "43d6e23158ff94d24a535f04f97ceec94f6ee2eb4984e3cd8e6dfc31d5228256" "ba46ba59c91ebb04e228cd9b83e24168e4272e7cff153aea4ad91b27c1f46c35" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "fec45178b55ad0258c5f68f61c9c8fd1a47d73b08fb7a51c15558d42c376083d" "159aab698b9d3fb03b495ce3af2d298f4c6dfdf21b53c27cd7f472ee5a1a1de3" "92192ea8f0bf04421f5b245d906701abaa7bb3b0d2b3b14fca2ee5ebb1da38d8" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "c9bc235533e9327aa248914026898a2e67d0025cd74aa8c31a858b12c27ba922" "c961c5340c18773f83ade8952dc8ae510773c60cb2591896cf2d0e591ddc6905" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "4cbec5d41c8ca9742e7c31cc13d8d4d5a18bd3a0961c18eb56d69972bbcf3071" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "62a6731c3400093b092b3837cff1cb7d727a7f53059133f42fcc57846cfa0350" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "28818b9b1d9e58c4fb90825a1b07b0f38286a7d60bf0499bc2dea7eea7e36782" "9955cc54cc64d6c051616dce7050c1ba34efc2b0613d89a70a68328f34e22c8f" "01e0367d8c3249928a2e0ebc9807b2f791f81a0d2a7c8656e1fbf4b1dbaa404c" "cb30d82b05359203c8378638dec5ad6e37333ccdda9dee8b9fdf0c902e83fad7" "be5b03913a1aaa3709d731e1fcfd4f162db6ca512df9196c8d4693538fa50b86" "55d31108a7dc4a268a1432cd60a7558824223684afecefa6fae327212c40f8d3" "d9850d120be9d94dd7ae69053630e89af8767c36b131a3aa7b06f14007a24656" "100eeb65d336e3d8f419c0f09170f9fd30f688849c5e60a801a1e6addd8216cb" "d83e34e28680f2ed99fe50fea79f441ca3fddd90167a72b796455e791c90dc49" "ad16a1bf1fd86bfbedae4b32c269b19f8d20d416bd52a87cd50e355bf13c2f23" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "5228973368d5a1ac0cbea0564d0cd724937f52cc06a8fd81fc65a4fa72ff837b" "52741e091463c2217af9327e2b2d74d0df861ecc3ad6131b6cbcb8d76b7a4d3d" "4605ce6e798971d215b01844ea39e993d683aa2fa118e02e263539298f9f3921" "6de7c03d614033c0403657409313d5f01202361e35490a3404e33e46663c2596" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "3c98d13ae2fc7aa59f05c494e8a15664ff5fe5db5256663a907272869c4130dd" "60e09d2e58343186a59d9ed52a9b13d822a174b33f20bdc1d4abb86e6b17f45b" "36746ad57649893434c443567cb3831828df33232a7790d232df6f5908263692" "ffac21ab88a0f4603969a24b96993bd73a13fe0989db7ed76d94c305891fad64" "fc7fd2530b82a722ceb5b211f9e732d15ad41d5306c011253a0ba43aaf93dccc" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "71182be392aa922f3c05e70087a40805ef2d969b4f8f965dfc0fc3c2f5df6168" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "0e219d63550634bc5b0c214aced55eb9528640377daf486e13fb18a32bf39856" "b9293d120377ede424a1af1e564ba69aafa85e0e9fd19cf89b4e15f8ee42a8bb" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "5436e5df71047d1fdd1079afa8341a442b1e26dd68b35b7d3c5ef8bd222057d1" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "0ae52e74c576120c6863403922ee00340a3bf3051615674c4b937f9c99b24535" "2da65cb7074c176ca0a33f06bcc83ef692c9175e41b6370f5e94eb5811d6ee3a" default)))
 '(elpy-eldoc-show-current-function nil)
 '(elpy-rpc-python-command "python3")
 '(elpy-test-discover-runner-command (quote ("python3" "-m" "unittest")))
 '(exec-path
   (quote
    ("/home/nicholas/anaconda3/bin/" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/snap/bin" "/usr/lib/emacs/24.5/x86_64-linux-gnu" "/home/nicholas/.local/bin")))
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd elixir emacs-lisp erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars haskell-ghc haskell-hlint html-tidy javascript-jshint javascript-eslint javascript-gjslint json-jsonlint less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint r-lintr racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(focus-dimness 1)
 '(global-linum-mode nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(linum-format " %3d ")
 '(magit-commit-arguments (quote ("--all")))
 '(markdown-command "pandoc")
 '(markdown-command-needs-filename t)
 '(markdown-open-command "nil")
 '(mode-icons-line-height-adjust 0)
 '(mode-icons-mode t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files (quote ("~/Documents")))
 '(org-capture-templates
   (quote
    (("r" "Random things that must be refiled later, not a TODO" entry
      (file+headline "~/Documents/gtd.org" "Refile")
      "* %? %t %^g")
     ("t" "Immediate tasks or TODO entries" entry
      (file+headline "~/Documents/gtd.org" "Tasks")
      "* TODO %? %t %^g" :prepend t))))
 '(org-fast-tag-selection-single-key t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("marmalade" . "https://marmalade-repo.org/packages/"))))
 '(package-selected-packages
   (quote
    (material-light-theme material-dark-theme yasnippet ac-js2 skewer-mode js2-mode js-comint matlab-mode bonjourmadame esup shell-history avy-flycheck smooth-scrolling spacemacs-theme moe-theme material-theme color-theme-modern autumn-light-theme flatui-theme 2048-game sx emacs-xkcd spaceline symon pretty-mode visual-regexp-steroids focus typo neotree dired+ projectile-speedbar cython-mode sr-speedbar realgud helm-pydoc py-isort hemisu-theme shm company-ghc ghc hindent haskell-mode csv-mode grandshell-theme alect-themes ample-theme use-package ein company-auctex auctex company-web company-anaconda exec-path-from-shell web-mode zenburn-theme xpm visual-fill-column theme-changer swiper solarized-theme shell-here seq rainbow-mode rainbow-delimiters multi monokai-theme markdown-mode+ magit helm-projectile helm-gtags gtags flycheck expand-region elpy company-c-headers base16-theme avy ascii-art-to-unicode)))
 '(prog-mode-hook
   (quote
    (rainbow-delimiters-mode linum-mode
			     (lambda nil
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("<=" . 8804))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       (">=" . 8805))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("!=" . 8800))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("neq" . 8800))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("infty" . 8734))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("<-" . 8592))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("->" . 8594))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("<==" . 8656))
				      prettify-symbols-alist))
			       (setq prettify-symbols-alist
				     (cons
				      (quote
				       ("==>" . 8658))
				      prettify-symbols-alist)))
			     auto-fill-mode)))
 '(python-shell-completion-native-disabled-interpreters (quote ("pypy" "ipython3" "ipython" "python3")))
 '(python-shell-interpreter "python3")
 '(python-shell-interpreter-interactive-arg "-i")
 '(rainbow-delimiters-max-face-count 7)
 '(realgud:pdb-command-name "python3 -m pdb")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(symon-monitors
   (quote
    (symon-linux-memory-monitor symon-linux-cpu-monitor symon-linux-battery-monitor)))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(visible-bell t)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(projectile-global-mode)
(helm-projectile-on)

;; maximize on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defun find-init ()
  (interactive)
  (find-file "/home/nicholas/.emacs.d/init.el")
  )
(global-set-key (kbd "C-c i") 'find-init)

;; shell-here
(require 'shell-here)
(global-set-key (kbd "C-c M-h") 'shell-here)

(put 'dired-find-alternate-file 'disabled nil)

;; (global-flycheck-mode)

(setq-default preview-scale-function 1.2)
(require 'tex-site)
(require 'company-auctex)
(company-auctex-init)

(put 'scroll-left 'disabled nil)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))


;; load other configuration files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/completion.el")
(load-file "~/.emacs.d/haskellconfig.el")
(load-file "~/.emacs.d/pythonconfig.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-face ((t (:inherit default))))
 '(rainbow-delimiters-mis-matched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-mismatched-face ((t (:background "#000000" :foreground "#ffff00"))))
 '(rainbow-delimiters-unmatched-face ((t (:inherit error :inverse-video t :weight bold))))
 '(variable-pitch ((t (:family "AppliedSansW01-Light"))))
 '(vertical-border ((t (:background "transparent")))))

(server-start)
