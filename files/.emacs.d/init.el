;;; init.el --- The emacs config file

; TURN off mouse interface early in startup to avoid momentary display
;;; Code:

(when (not (display-graphic-p))
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez

(setq inhibit-startup-message t)

(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(setq tab-always-indent 'complete)

;;; Commentary:
;; 

(require 'package)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("elpa"  . "http://tromey.com/elpa/")
                         ("melpa" . "http://melpa.org/packages/")))

; List the packages you want
(setq package-list '(use-package))

; Add Melpa as the default Emacs Package repository
; only contains a very limited number of packages
(add-to-list 'package-archives package-list)

; Activate all the packages (in particular autoloads)
(package-initialize)

; Update your local package index
(unless package-archive-contents
  (package-refresh-contents))

; Install all missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Set up load path
(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))

(require 'use-package)

(use-package subatomic256-theme
  :ensure t
  :init (load-theme 'subatomic256 t))

(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list))
  :init (setq helm-M-x-fuzzy-match                  t
	      helm-bookmark-show-location           t
	      helm-buffers-fuzzy-matching           t
	      helm-completion-in-region-fuzzy-match t
	      helm-file-cache-fuzzy-match           t
	      helm-imenu-fuzzy-match                t
	      helm-mode-fuzzy-match                 t
	      helm-locate-fuzzy-match               t
	      helm-quick-update                     t
	      helm-recentf-fuzzy-match              t
	      helm-semantic-fuzzy-match             t))

(use-package helm-ag
  :ensure t
  :bind ("C-c a g" . helm-do-ag-project-root))

(use-package projectile
  :ensure t
  :commands (projectile-find-file projectile-switch-project)
  :diminish projectile-mode
  :init
  (use-package helm-projectile
    :ensure t
    :bind (("C-c p f" . helm-projectile-find-file)
           ("C-c p s" . helm-projectile-switch-project)))
  :config
  (projectile-global-mode))

(use-package neotree
  :ensure t
  :init (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
        (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
        (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
        (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
        (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package org
  :ensure t)

(use-package slim-mode
  :ensure t)

(require 'elixir)
(require 'scala)
(require 'git)

(provide 'init)

;;; init.el ends here
