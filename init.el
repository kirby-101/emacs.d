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

;;
;;; ToDo
;;
;; 

;; faster GC for startup
(setq gc-cons-threshold (* 64 1024 1024))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 16 1024 1024)))
          )

;; ??
(recentf-mode 1)
(setq recentf-max-saved-items 500)
