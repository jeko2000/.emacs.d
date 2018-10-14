(let* ((file "ticketnetwork")
       (expanded (expand-file-name file org-directory)))
  (when (file-exists-p expanded)
    (add-to-list 'org-agenda-files expanded)))
