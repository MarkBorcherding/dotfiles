(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

(load-file "~/.emacs.d/appearance.el")


;; use the option key as M
(setq mac-command-modifier 'alt
       mac-option-modifier 'meta)


 (add-to-list 'load-path "~/.emacs.d/emacs-starter-kit/")
 (require 'starter-kit-ruby)

;; ri-emacs
(setq ri-ruby-script (expand-file-name "~/.emacs.d/my_emacs_for_rails/plugins/ri-emacs/ri-emacs.rb"))
;(autoload 'ri (expand-file-name "~/.emacs.d/plugins/ri-emacs/ri-ruby.el") nil t)
(load "~/.emacs.d/my_emacs_for_rails/plugins/ri-emacs/ri-ruby.el")