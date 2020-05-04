;;;Emacs init file
(message "Emacs init.el started at %s" (current-time-string))

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
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") 'append)
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

;; Set use-package to always `ensure' packages. This means that
;; packages will be downloaded from the packages by default.
(setq use-package-always-ensure t)

;; Load custom.el, if it exits.
(load (expand-file-name "custom.el" user-emacs-directory) 'noerror)

;; Evaluate helper method which tangles an org file only when needed
(require 'org)
(defun jr/org-babel-tangle-file-if-needed (file)
  "Tangle contents of FILE, if needed.
Specifically, FILE is tangled only if no tangled file already
exists or if FILE was modified after the last tangle.
Returns the tangled file as a string."
  (let ((tangled-file (concat (file-name-sans-extension file) ".el")))
    (when (or (not (file-exists-p tangled-file))
              (time-less-p (nth 5 (file-attributes tangled-file))
                           (nth 5 (file-attributes file))))
      (message "Retangling file %s" file)
      (org-babel-tangle-file file tangled-file "emacs-lisp"))
    tangled-file))

;; Load configuration in config.org, if file exists.

;; Note that config.org is _not_ an emacs-lisp source file, which
;; explains why we don't use `load' to load it. See the Org manual for
;; all the details.
(let ((org-config
       (expand-file-name "settings/config.org" user-emacs-directory)))
  (when (file-exists-p org-config)
    (load-file
     (jr/org-babel-tangle-file-if-needed org-config))))

(message "Emacs ready at %s" (current-time-string))
