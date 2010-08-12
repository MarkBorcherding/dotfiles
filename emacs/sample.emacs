(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

 (add-to-list 'load-path "~/.emacs.d/color-theme/")
(load-file (expand-file-name "~/.emacs.d/appearance.el"))


;; use the option key as M
(setq mac-command-modifier 'alt
       mac-option-modifier 'meta)


 (add-to-list 'load-path "~/.emacs.d/emacs-starter-kit/")
 (require 'starter-kit-ruby)

;; ri-emacs
(setq ri-ruby-script (expand-file-name "~/.emacs.d/my_emacs_for_rails/plugins/ri-emacs/ri-emacs.rb"))
;(autoload 'ri (expand-file-name "~/.emacs.d/plugins/ri-emacs/ri-ruby.el") nil t)
(load "~/.emacs.d/my_emacs_for_rails/plugins/ri-emacs/ri-ruby.el")


(add-to-list 'load-path "~/.emacs.d/my_emacs_for_rails/plugins/auto-complete")
(require 'auto-complete-config)

   (global-auto-complete-mode t)           ;enable global-mode
   (setq ac-auto-start t)                  ;automatically start
   (setq ac-dwim 3)                        ;Do what i mean
   (setq ac-override-local-map nil)        ;don't override local map

(tool-bar-mode -1)

;; Replace $RSENSE_HOME with the directory where RSense was installed in full path
;; Example for UNIX-like systems
;; (setq rsense-home "/home/tomo/opt/rsense-0.2")
;; or
;; (setq rsense-home (expand-file-name "~/opt/rsense-0.2"))
;; Example for Windows
;; (setq rsense-home "C:\\rsense-0.2")
(setq rsense-home (expand-file-name "~/.emacs.d/rsense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)


(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))


(add-to-list 'load-path "~/.emacs.d/my_emacs_for_rails/plugins/javascript")
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
    
