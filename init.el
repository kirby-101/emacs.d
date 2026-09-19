;;; -*- lexical-binding: t; -*-
;;; ~/.emacs.d/init.el kirby@bsdlab
;; Signal: (@kirby.41)


;;
;;; Dependencies
;;
;;  libvterm gopls clangd clang-format rust-analyzer
;; npm install -g vscode-json-language-server vscode-css-language-server vscode-html-language-server vscode-eslint-language-server vscode-markdown-language-server

;;? (setq make-backup-files nil)
;;
;;; ToDo
;;
;; language-server: rust, elisp, html, css, javascript, bash, python3, yaml, json, Makefile
;; Helm für eglot
;; eldoc,flymake,xref,company


;; load .emacs.d: normal / symlink
;; (add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path
             (expand-file-name "~/Workspace/emacs.d" user-emacs-directory)
             )

;; um die übersicht zu behalten
(add-to-list 'load-path
             (expand-file-name "~/Workspace/emacs.d/bsdlab" user-emacs-directory)
             )

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
