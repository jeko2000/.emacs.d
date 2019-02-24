(defun jr/maybe-add-to-agenda-files (file)
  (let ((expanded (expand-file-name file org-directory)))
    (when (file-exists-p expanded)
      (add-to-list 'org-agenda-files expanded))))

(jr/maybe-add-to-agenda-files "ticketnetwork")
(jr/maybe-add-to-agenda-files "interactivebrokers")
