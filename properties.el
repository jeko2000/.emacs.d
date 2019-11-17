;;; properties.el
;; from personal
(when (boundp 'jr/user-full-name)
  (setq user-full-name jr/user-full-name))
(when (boundp 'jr/user-mail-address)
  (setq user-full-name jr/user-mail-address))

;; zoom-frm
(setq jr/zoom-frm-desired-zoom 1)

;; bongo
(setq jr/bongo-music-directory "/data/music/")
(setq jr/volume-raise-volume-command "pactl set-sink-volume @DEFAULT_SINK@ +5%")
(setq jr/volume-lower-volume-command "pactl set-sink-volume @DEFAULT_SINK@ -5%")
