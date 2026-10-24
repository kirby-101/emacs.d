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
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.1)
  )
;;(setq company-minimum-prefix-length 1
;; company-idle-delay 0.0)

(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :custom
  (flymake-no-changes-timeout 0.5)
  (flymake-fringe-indicator-position 'right-fringe)
  (flymake-show-diagnostics-at-end-of-line 'short)
  )

(use-package yasnippet
  :ensure t
  :hook (prog-mode . yas-minor-mode))
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;; C / C++

;; Golang
(use-package go-mode
  :ensure t
  :init
  (setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/go/bin"))
  
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
  (setq-default eglot-workspace-configuration
                '(:gopls (:staticcheck t
                        ;;:gofumpt t
                        :usePlaceholders t
                        :completeUnimported t
                        :deepCompletion t
                        :hoverKind "FullDocumentation"
                        :linksInHover t
                        :annotations (:bounds t :escape t :inline t :nil t)
                        :analyses (:ST1000 :json-false
                                   :ST1020 :json-false
                                   :ST1021 :json-false
                                   :ST1022 :json-false)
                        
                        :hints (:parameterNames t
                                :assignVariableTypes t
                                :compositeLiteralFields t
                                :constantValues t
                                :rangeVariableTypes t)))
              )
  )


;; Golang: delve
(use-package dape :ensure t)

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

;; YAML
(use-package yaml-mode
  :ensure t
  :mode "\\.ya?ml\\'"
  )

;; nginx.conf
(use-package nginx-mode
  :ensure t
  :mode ("nginx\\.conf\\'"
         "/nginx/.*\\.conf\\'"
         "/sites-\\(?:available\\|enabled\\)/"))

;; Makefile
(use-package make-mode
  :ensure nil
  :mode (("Makefile\\'" . makefile-bsdmake-mode)
         ("GNUmakefile\\'" . makefile-gmake-mode)
         ("\\.mk\\'" . makefile-bsdmake-mode))
  )

;;; Module
(provide 'bsdlab-modes)
