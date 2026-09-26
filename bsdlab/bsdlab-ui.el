;;; -*- lexical-binding: t; -*-
;;; ~/.emacs.d/ui.el kirby@bsdlab
;; Signal: (@kirby.41)

(setq
 inhibit-startup-message t   ; no mot
 ring-bell-function 'ignore  ; Quiet
 scroll-margin 1             ; Space between cursor and top/bottom
 initial-scratch-message nil ; clean scratch buf
 inhibit-startup-buffer-menu t
 create-lockfiles nil        ; Disable lockfiles
 echo-keystrokes 0.1         ; Show keystrokes asap
 auto-revert-interval 1      ; Refresh buffers fast
 )

;; save&restore emacs sessions
;;(desktop-save-mode 0)
;;(setq desktop-path (list user-emacs-directory))
;;(setq desktop-dirname user-emacs-directory)
;;(setq desktop-base-file-name "desktop")

(scroll-bar-mode -1)   ; scrollbar
(tool-bar-mode -1)     ; toolbar
(menu-bar-mode -1)     ; menubar
(blink-cursor-mode 0)  ; solid cursor

;; Klammern/Anfuehrungszeichen automatisch schliessen: ( setzt sofort )
(electric-pair-mode 1)


;; No Region when it is not highlighted
(transient-mark-mode 1) 


;; Allow for shorter responses: "y" for yes and "n" for no.
(setq read-answer-short t)
(if (boundp 'use-short-answers)
    (setq use-short-answers t)
  (advice-add 'yes-or-no-p :override #'y-or-n-p))
(setq revert-buffer-quick-short-answers t)

;; Line Nums
(column-number-mode)
(global-display-line-numbers-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; disable line-numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook
                neotree-mode-hook
                vterm-mode-hook
                ))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; rainbow: colourful  parethses
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package rainbow-identifiers
  :ensure t
  :hook (prog-mode . rainbow-identifiers-mode)
  )

(defun bsdlab-vterm-toggle ()
  (interactive)
  (if-let ((window (get-buffer-window "*vterm*")))
      (progn
        (delete-window window)
        (kill-buffer "*vterm*"))
    (vterm))
  )


;; Terminal via libvterm => M-RET
(use-package vterm
  :ensure t
  :commands vterm
  :bind ("M-RET" . bsdlab-vterm-toggle)
  :config
  (add-to-list 'display-buffer-alist
               '("\\*vterm.*\\*"
                 (display-buffer-reuse-window
                  display-buffer-at-bottom)
                 (window-height . 0.3)))
  )


;;; Module
(provide 'bsdlab-ui)
