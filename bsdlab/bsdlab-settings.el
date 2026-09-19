;;; -*- lexical-binding: t; -*-
;;; ~/.emacs.d/settings.el kirby@bsdlab
;; Signal: (@kirby.41)

(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(setq-default
 tab-width 4                    ; smaller tabs
 truncate-lines t                ; dont fold lines
 indent-tabs-mode nil             ; spaces instead of tabs
 frame-resize-pixelwise t         ; Fine-grained frame resize
 sentence-end-double-space nil    ; No double space
 )


;; autosave Directory
(defvar emacs-autosave-directory
  (concat user-emacs-directory "autosaves/")
  )

(setq
 backup-directory-alist
 `((".*" . ,emacs-autosave-directory))
 auto-save-file-name-transforms
 `((".*" ,emacs-autosave-directory t))
 )

;; remember usage history
(savehist-mode 1)

;; export custom settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)


;;; Module
(provide 'bsdlab-settings)
