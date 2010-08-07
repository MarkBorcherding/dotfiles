(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))


 (load-file "~/.emacs.d/twilight-emacs/color-theme-twilight.el")      
 (load-file "~/.emacs.d/emacs-starter-kit/elpa-to-submit/zenburn.el")
 (load-file "~/.emacs.d/emacs-starter-kit/elpa-to-submit/blackboard.el")

(color-theme-twilight)

(defun make-emacs-translucent()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha 90))

(defun make-emacs-almost-tranparent()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha 60))

(defun make-emacs-opaque()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha 100))

(defun make-emacs-transparent()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha 40))

(make-emacs-translucent)
