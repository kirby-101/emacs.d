;;; -*- lexical-binding: t; -*-
;;; ~/.emacs.d/theme.el kirby@bsdlab
;; Signal: (@kirby.41)

;; Transparency
(set-face-attribute 'default nil :height 100)
(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))



(use-package modus-themes
  :ensure t
  :init
  (require-theme 'modus-themes)
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts t)
  (modus-themes-variable-pitch-ui t)
  (modus-themes-custom-auto-reload t)
  (modus-themes-disable-other-themes t)
  (modus-themes-prompts '(italic bold))
  (modus-themes-completions
   '((matches . (extrabold))
     (selection . (semibold italic text-also))))
  (modus-themes-org-blocks 'gray-background)
  (modus-themes-headings
   '((1 . (variable-pitch 1.5))
     (2 . (1.3))
     (agenda-date . (1.3))
     (agenda-structure . (variable-pitch light 1.8))
     (t . (1.1))))
  (modus-vivendi-palette-overrides
   '(
     (bg-main "#000000")
     (bg-dim "#111111")
     (bg-active "#222222")
     (bg-inactive "#333333")
     (fg-main "#ffffff")
     (fg-dim)
     (cursor "#00ffff")
     (warning "#fafad2")
     (bg-completion "#2e8b57")
     (bg-region bg-active)
     (bg-tab-bar bg-main)
     (bg-tab-current bg-active)
     (bg-tab-other bg-dim)
     (fringe unspecified)
     (bg-mode-line-active bg-dim)
     (border-mode-line-active unspecified)
     (bg-line-number-active bg-main)
     (bg-line-number-inactive bg-main)
     ))
  :config
  (load-theme 'modus-vivendi t)
  )





;; Font: Fira Code
(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 't '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                               ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                               "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                               "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                               "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                               "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                               "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                               "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                               "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                               "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))
  (global-ligature-mode 't)
  (set-face-attribute 'default nil :font "Fira Code")
  )




;; Icons
(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  )



;; Projectile
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :hook (emacs-startup . treemacs)
  :config
  (progn
    (setq treemacs-display-in-side-window t
          treemacs-follow-after-init t
          treemacs-expand-after-init t
          treemacs-hide-dot-git-directory t
          treemacs-indentation 2
          treemacs-indentation-string " "
          treemacs-is-never-other-window nil
          treemacs-move-files-by-mouse-dragging t
          treemacs-persist-file (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position 'left
          treemacs-litter-directories '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor nil
          treemacs-show-hidden-files t
          treemacs-sorting 'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes t
          treemacs-width 35
          treemacs-width-increment 1
          treemacs-width-is-initially-locked t
          treemacs-workspace-switch-cleanup nil
          )

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    ;; treemacs,treemacs-select-window, treemacs-add-and-display-current-project
    ;; treemacs-indent-guide-mode;; = line

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (treemacs-git-mode 'deferred)
    ;; (treemacs-hide-gitignored-files-mode nil)) ??
    )
  :bind (:map global-map
              ("M-0" . treemacs-select-window)
              ("C-x t 1" . treemacs-delete-other-windows)
              ("C-x t t" . treemacs)
              ("C-x t d" . treemacs-select-directory)
              ("C-x t B" . treemacs-bookmark)
              ("C-x t C-t" . treemacs-find-file)
              ("C-x t M-t" . treemacs-find-tag)
              )
  )



(use-package treemacs-nerd-icons
  :ensure t
  :after treemacs
  :config
  (treemacs-load-theme "nerd-icons")
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t
  )

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t
  )

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind
  ("C-c p" . projectile-command-map)
  )

;; Display available keybindings in buffer
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  )







;; NeoTree
;;(use-package neotree
;;  :config
;;  (neotree-dir "~/Workspace")
;;  (setq neo-theme (if (display-graphic-p) 'nerd-icons 'classic))
;;  (setq projectile-switch-project-action 'neotree-projectile-action)
;;  )




;; !! doom-modeline !!
;; buffer, (BEGIN/END Zeile, index), position?,magit?: git branch, git status, eglot, docs, errors/warns


;;; Module
(provide 'bsdlab-theme)
