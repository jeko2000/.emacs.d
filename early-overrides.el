(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(let ((dir "/data/rep/personal/org"))
  (if (file-exists-p dir)
      (setq jr/org-directory dir)))

;; Zoom frm
(setq jr/zoom-frm-desired-zoom 1)


;; Bongo
(setq jr/bongo-music-directory "/data/music/")
(setq jr/volume-raise-volume-command "pactl set-sink-volume @DEFAULT_SINK@ +5%")
(setq jr/volume-lower-volume-command "pactl set-sink-volume @DEFAULT_SINK@ -5%")
