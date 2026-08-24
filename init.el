;;; ~/.emacs.d/init.el kirby@bsdlab
;; Signal: (@kirby.41)

(require 'bsdlab-keymap)
(require 'bsdlab-modes)
(require 'bsdlab-packages)
(require 'bsdlab-plugins)
(require 'bsdlab-settings)
(require 'bsdlab-theme)
(require 'bsdlab-ui)


;; export to custom.el
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; faster GC for startup
(setq gc-cons-threshold (* 64 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 16 1024 1024)))
          )

;; last opened files history
(recentf-mode 1)
(setq recentf-max-saved-items 500)

;;? .gitconfig

;;(use-package nano-modeline
;;  :init
;;  (setq-default mode-line-format nil) ; Disable the default modeline
;;  :config
;;  (add-hook 'prog-mode-hook #'nano-modeline-prog-mode)
;;  (add-hook 'text-mode-hook #'nano-modeline-text-mode)
;;  )
;;(setq nano-font-family-monospaced "Roboto Mono")
;;(setq nano-font-size 14)

;; Parethses
;;(use-package paredit
;;  :defer t
;;  :bind (:map paredit-mode-map ("RET" . nil))
;;  :hook ((
;;          lisp-mode
;;          emacs-lisp-mode
;;          lisp-interaction-mode
;;          scheme-mode)
;;         . paredit-mode)
;;  :config
;;  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;;  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;;  )

;; NeoTree
;;(use-package neotree
;;  :config
;;  (neotree-dir "~/Workspace")
;;  (setq neo-theme (if (display-graphic-p) 'nerd-icons 'classic))
;;  (setq projectile-switch-project-action 'neotree-projectile-action)
;;  )
