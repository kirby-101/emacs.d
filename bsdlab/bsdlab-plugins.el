;;; -*- lexical-binding: t; -*-
;;; ~/.emacs.d/plugins.el kirby@bsdlab
;; Signal: (@kirby.41)


;; Dashboard
(defun my/dashboard-banner ()
  "Set a dashboard banner including information on package initialization
time and garbage collections."
  (setq dashboard-banner-logo-title
        (format "Loaded in %.2f seconds with %d garbage collections."
                (float-time (time-subtract after-init-time before-init-time)) gcs-done)
        )
  )





(use-package dashboard
  :ensure t
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'my/dashboard-banner)
  :config
  (setq dashboard-startup-banner 4) ; banner
  (setq dashboard-center-content t) ; center content
  (setq dashboard-items '((recents . 5)
                           (bookmarks . 5)
                           (projects . 5)))
  ;; nerd-icons
  (setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
  (setq dashboard-startupify-list '(dashboard-insert-banner
                                     dashboard-insert-newline
                                     dashboard-insert-footer
                                     dashboard-insert-banner-title
                                     dashboard-insert-navigator
                                     dashboard-insert-items
                                     dashboard-insert-newline
                                     )
        )
  (dashboard-setup-startup-hook)
  )


;; !!!!
;; Magit
(use-package magit
  :ensure t
  :defer t
  )

;; .editorconfig file for projects
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1)
  )

;; Better Comments
(use-package hl-todo
  :ensure t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces '(
                                ("ToDo"  . "#FFCC00")
                                ("ToBe"  . "#FF4D00")
                                ("!!"     . "#FF5555")
                                ("??"     . "#61AFEF")
                                ("*"     . "#98C379")
                                ))
  )


;;; Module
(provide 'bsdlab-plugins)
