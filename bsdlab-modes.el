;;; -*- lexical-binding: t; -*-
;;; ~/.emacs.d/modes.el kirby@bsdlab
;; Signal: (@kirby.41)


;; npm install -g bash-language-server vscode-langservers-extracted typescript-language-server yaml-language-server bash-language-server
;; doas ln -s /usr/local/bin/clangd20 /usr/local/bin/clangd

;; clangd / ccls ; gopls ; vscode-json-language-server ; bash-language-server start ; javascript ls ; yaml-language-server
;; vscode-html-language-server / html-languageserver ; markdown habe ich? ; terraform kann raus ; Makefile ; ist python3 ls richtig?

;; eglot-mode
(use-package eglot
  :ensure t
  :defer t
  :hook ((c-mode c++-mode
          python-mode
          sh-mode
          yaml-mode
          json-mode
          html-mode) . eglot-ensure)
  :config
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'eglot-format nil t)))
  (setq eglot-events-buffer-size 0)
  )

;; company-mode
(use-package company
  :ensure t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :bind (:map company-active-map
              ("TAB" . company-complete-selection)
              ("<tab>" . company-complete-selection)
              )
  :config (global-company-mode)
  )
;;(setq company-minimum-prefix-length 1
;; company-idle-delay 0.0)

;; C / C++

;; Golang
(use-package go-mode
  :ensure t
  :defer t
  :mode "\\.go\\'"
  :hook (
         (go-mode . eglot-ensure)
         (go-mode . (lambda ()
                      (add-hook 'before-save-hook 'eglot-format-buffer nil t)
                      ))
         )
  :config
  (autoload 'go-mode "go-mode" nil t)
  ;;:bind
  ;; ("C-c C-c" . ) ;; => go build/run .
  )

;; Python
(use-package python
  :ensure nil
  :hook (python-mode . (lambda () (setq forward-sexp-function nil)))
  :config
  ;; nicht auf eine feste Minor-Version pinnen (fragil bei Port-Upgrades),
  ;; sondern das erste passende Interpreter-Binary im PATH nehmen.
  (setq python-shell-interpreter
        (or (executable-find "python3")
            (executable-find "python")
            "python3"))
  )

;; Markdown
(use-package markdown-mode
  :ensure t
  :defer t
  :hook (markdown-mode . (lambda () (setq fill-column 72)))
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  )

;; JSON
(use-package json-mode
  :ensure t
  :mode
  ("\\.json$" . json-mode)
  ("\\.jsonc$" . json-mode)
  )


;;; Module
(provide 'bsdlab-modes)
