;;; scala.el --- Setup emacs for Scala development

;;; Commentary:
;; 

;;; Code:

(use-package ensime
  :ensure t)

(use-package scala-mode
  :ensure t)

(use-package sbt-mode
  :ensure t)

(provide 'scala)

;;; scala.el ends here
