(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(auth-source-save-behavior nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("31992d4488dba5b28ddb0c16914bf5726dc41588c2b1c1a2fd16516ea92c1d8e" "12b204c8fcce23885ce58e1031a137c5a14461c6c7e1db81998222f8908006af" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-sexp-background-color "#1c1f26")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (hide-mode-line org-present counsel swiper clojure-mode iy-go-to-char magit ivy yasnippet-snippets yasnippet company emms org-plus-contrib org frame-cmds frame-fns 0blayout pdf-tools nov geiser slime-company common-lisp-snippets commonlisp-snippets column-marker deferred rainbow-delimiters impatient-mode markdown-mode zoom-frm zenburn-theme which-key web-mode waher-theme w3m visual-regexp-steroids use-package undo-tree transpose-frame tangotango-theme swiper-helm sr-speedbar solarized-theme smooth-scrolling smex smartscan smartparens slime skewer-mode shell-pop scratch restclient quickrun python-mode perspective pdb-mode password-store paredit org-pandoc olivetti nlinum neotree multiple-cursors multi-term monokai-theme material-theme magit-gitflow less-css-mode jdee ido-vertical-mode hydra hindent helm-swoop helm-projectile helm-gtags helm-ag hayoo haskell-mode gradle-mode gnus-desktop-notify ggtags flycheck expand-region emmet-mode elpy edit-server drag-stuff disable-mouse cyberpunk-theme crux counsel-projectile company-c-headers command-log-mode bongo bbdb arjen-grey-theme android-mode alert ace-window ace-jump-mode ac-html ac-cider 4clojure)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((eval progn
           (setq org-latex-tables-centered nil org-latex-default-table-environment "longtable")
           (local-set-key
            (kbd "<f5>")
            (lambda nil
              (interactive)
              (beginning-of-buffer)
              (re-search-forward "Invoice date: *")
              (kill-region
               (point)
               (save-excursion
                 (end-of-line)
                 (point)))
              (org-insert-time-stamp
               (current-time)
               nil t)
              (beginning-of-buffer)
              (search-forward "#+BEGIN: clocktable")
              (unwind-protect
                  (progn
                    (defadvice org-table-goto-column
                        (before always-make-new-columns
                                (n &optional on-delim force)
                                activate)
                      "always adds new columns when we move to them"
                      (setq force t)))
                (org-clock-report)
                (ad-deactivate
                 (quote org-table-goto-column)))
              (beginning-of-buffer)
              (search-forward "| totaltarget")
              (org-table-recalculate t))))
     (eval progn
           (local-set-key
            (kbd "<f5>")
            (lambda nil
              (interactive)
              (beginning-of-buffer)
              (re-search-forward "Invoice date: *")
              (kill-region
               (point)
               (save-excursion
                 (end-of-line)
                 (point)))
              (org-insert-time-stamp
               (current-time)
               nil t)
              (beginning-of-buffer)
              (search-forward "#+BEGIN: clocktable")
              (unwind-protect
                  (progn
                    (defadvice org-table-goto-column
                        (before always-make-new-columns
                                (n &optional on-delim force)
                                activate)
                      "always adds new columns when we move to them"
                      (setq force t)))
                (org-clock-report)
                (ad-deactivate
                 (quote org-table-goto-column)))
              (beginning-of-buffer)
              (search-forward "| totaltarget")
              (org-table-recalculate t))))
     (eval message "Loaded")
     (Package . CL-WHO)
     (Package . HUNCHENTOOT)
     (Base . 10)
     (Package . CL-USER)
     (Syntax . COMMON-LISP))))
 '(send-mail-function (quote smtpmail-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-info ((t (:foreground "#81d4fa" :weight bold :height 1.35))))
 '(org-document-info-keyword ((t (:foreground "#8bc34a" :height 1.35))))
 '(org-document-title ((t (:foreground "#ffffff" :weight bold :height 1.35)))))
