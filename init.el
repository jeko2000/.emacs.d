;;;Emacs init file
;; Basic GUI changes
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(setq visible-cursor nil
      inhibit-startup-message t
      initial-scratch-message "")

;;; Set up package
(require 'package)

(defvar gnu '("gnu" . "https://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "https://melpa.org/packages/"))
(defvar melpa-stable '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq package-archives '())

(add-to-list 'package-archives melpa-stable)
(add-to-list 'package-archives melpa t)
(add-to-list 'package-archives gnu t)
;;(package-initialize)

;; Set up load-path
(setq site-lisp-directory (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-directory)

(dolist (project (directory-files site-lisp-directory t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Bootstrap use-package
;; The excellent use-package by John Wiegley is described here:
;; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; The following comes from the use-package README
(eval-when-compile
  (require 'use-package))
  (require 'diminish)
(require 'bind-key)
(setq use-package-verbose t)

;; Set up user-settings-directory if it exists
(let ((settings (expand-file-name "settings" user-emacs-directory)))
  (setq user-settings-directory
        (if (file-exists-p settings) settings user-emacs-directory)))

;; Load custom-file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load org-mode source early on
(let ((org-source (expand-file-name "org-mode/lisp" site-lisp-directory))
      (org-contrib-source (expand-file-name "org-mode/contrib/lisp" site-lisp-directory)))
  (when (file-exists-p org-source)
    (add-to-list 'load-path org-source))
  (when (file-exists-p org-contrib-source)
    (add-to-list 'load-path org-contrib-source)))

;; Load the rest of the configuration
(setq org-config-file (expand-file-name "config.org" user-settings-directory))
(org-babel-load-file org-config-file nil)

(message "Config: OK")
