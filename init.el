;;;Emacs init file
;; Basic GUI changes
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq visible-cursor nil
      inhibit-startup-message t
      initial-scratch-message "")

;;; Set up package
(require 'package)

(defvar gnu '("gnu" . "https://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "https://melpa.org/packages/"))
(defvar melpa-stable '("melpa-stable" . "https://stable.melpa.org/packages/"))
(defvar org-current '("org" . "https://orgmode.org/elpa/"))

(setq package-archives '())

(add-to-list 'package-archives melpa-stable)
(add-to-list 'package-archives melpa t)
(add-to-list 'package-archives gnu t)
(add-to-list 'package-archives org-current t)
;;(package-initialize)

;; Bootstrap use-package
;; The excellent use-package by John Wiegley is described here: https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; The following comes from the use-package README
(eval-when-compile
  (require 'use-package))
;; (require 'diminish) ;; Commenting out since I don't use :diminish
(require 'bind-key)
(setq use-package-verbose t)

;; Set up user-settings-directory if it exists
(let ((settings (expand-file-name "settings" user-emacs-directory)))
  (setq user-settings-directory (if (file-exists-p settings) settings user-emacs-directory)))

;; Set up load-path
(setq site-lisp-directory (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-directory)

;; Load custom-file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load the rest of the configuration
(setq org-config-file (expand-file-name "config.org" user-settings-directory))
(org-babel-load-file org-config-file nil)

(message "Config: OK")
