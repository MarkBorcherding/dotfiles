;;; git.el --- Settings for git


;;; Commentary:
;; 

;;; Code:

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package evil-magit
  :ensure t)

(provide 'git)

;;; git.el ends here
