;;;Emacs init file
(message "Emacs init.el start")

;; Load private.el, if it exists.
;; This file contains any user-specific information to keep outside of
;; version control
(load (expand-file-name "private.el" user-emacs-directory) 'noerror)

;; Configure package archives.
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; Optionally, uncomment line below to also add melpa-stable to the
;; package archives. The 'append keyword allows for the archive to be
;; added to be appended to the end of the list, which effectively
;; gives it lower priority when searching for packages.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") 'append)
(package-initialize)

;; Add the site-lisp directory to the load path.
;; This is where I usually put files which fail to be found in the
;; package archives above.
(setq site-lisp-directory (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path site-lisp-directory)

;; Bootstrap use-package which we will use for the bulk of the
;; configurations.
;; This excellent package by John Wiegley is described here:
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

;; Load custom.el, if it exits.
(load (expand-file-name "custom.el" user-emacs-directory) 'noerror)

;; Load configuration in config.org, if file exists.

;; Note that config.org is _not_ an emacs-lisp source file, which
;; explains why we don't use `load' to load it. See the Org manual for
;; all the details.
(let ((org-config
       (expand-file-name "settings/config.org" user-emacs-directory)))
  (when (file-exists-p org-config)
    (org-babel-load-file org-config)))

(message "Emacs ready")
