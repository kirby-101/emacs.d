;;; ~/.emacs.d/packages.el kirby@bsdlab
;; Signal: (@kirby.41)

(require 'package)

;; Package Repositories
(setq package-archives
      '(("GNU ELPA"    . "https://elpa.gnu.org/packages/")
        ("MELPA"       . "https://melpa.org/packages/")
        ("MELPA STABLE" . "https://stable.melpa.org/packages/")))

;; repository priorities
(setq package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA"        . 5)
        ("MELPA STABLE" . 0)))

;; upgrade packages on init
(setq package-install-upgrade-built-in t)
(package-initialize)

;; refresh package list
(unless package-archive-contents
  (package-refresh-contents))


;;
;;; use-package
;;

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)


;;
;;; auto package upgrade
;;

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)

  ;; Wait until Emacs has been idle for 5 seconds before checking
  ;; for package updates. This avoids delaying startup.
  ;; wait 5min idle before bulk package upgrade
  (run-with-idle-timer 300 nil #'auto-package-update-maybe)
  )


;;; Module
(provide 'bsdlab-packages)
