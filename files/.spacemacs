;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; Don't autosave and backup everything
(setq auto-save-default nil)
(setq make-backup-files nil)

(setq ensime-startup-notification nil) ;; Stop the warning buffer from opening on startup
(setq ensime-startup-snapshot-notification nil) ;; Stop the warning buffer from opening on startup

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     elm
     vimscript
     python
     ruby
     sql
     ;; (colors :variables colors-enable-nyan-cat-progress-bar t) ;; Nyan cat looks fine in Gruvbox, but not so much in Nord
     csharp
     colors
     auto-completion
     better-defaults
     dash
     docker
     elixir
     emacs-lisp
     emoji
     ess
     git
     github
     helm
     html
     imenu-list
     javascript
     markdown
     org
     react
     restclient
     (scala :variables scala-auto-insert-asterisk-in-comments t scala-auto-start-ensime t)
     slack
     shell
     shell-scripts
     spell-checking
     tmux
     typescript
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      all-the-icons           ;; Allow icons to be used in places where it makes senseall-the-icons
                                      all-the-icons-dired     ;; Use the pretty icons in dirmode
                                      groovy-mode             ;; Syntax highlighting for jenkins-deploy-file stuff
                                      load-dir                ;; used to load a bunch of files from Dropbox
                                      play-routes-mode        ;; Get syntax highlights in play routes file
                                      zoom-window             ;; Zoom frames like tmux zooms panes
                                      org                     ;; Just trying to get org-agenda to work

                                      highlight-symbol        ;; See where symbols are used in the buffer
                                      popup-imenu             ;; Visually jump around a buffer

                                      ;; Neo4j Stuff
                                      cypher-mode             ;; Syntax Highlighting for Neo4j Cypher Queries
                                      ;; ob-cypher               ;; org mode the cyphers
                                      n4js                    ;; Open a cypher shell inside emacs

                                      ;; JavaScript stuff
                                      indium                  ;; Cool javascript stuff
                                      eslintd-fix             ;; Run eslint --fix on save
                                      add-node-modules-path   ;; Help Emacs find the node modules
                                      rjsx-mode               ;; A better react mode

                                      ;; Appearance
                                      gruvbox-theme           ;; The best colors
                                      material-theme          ;; less than the best colors
                                      nord-theme              ;; you got the blues colors
                                      kaolin-themes           ;; trying some new themes
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '(
                                (agenda . 5)
                                (recents . 5)
                                (projects . 7)
                                (todos . 3)
                                )
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gruvbox kaolin-eclipse nord spacemacs-dark idea-darkula dracula subatomic)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Input Mono"
                               :size 12
                               ;; :weight light
                               :width normal
                               :powerline-scale 1.4)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.

  It is called immediately after `dotspacemacs/init', before layer configuration
  executes. This function is mostly useful for variables that need to be set
  before packages are loaded. If you are unsure, you should try in setting them
  in `dotspacemacs/user-config' first."

  (setq
   nord-comment-brightness 10                     ;; By default comments are too dim
   ispell-program-name "/usr/local/bin/ispell"    ;; I don't know why it cannot find this from the path

   ;; doesn't add all the things to the path
   ;;exec-path-from-shell-rc-file-path "~/.zshrc" ;; Still trying to get Emacs happy with the path
   ;;                                               ;; https://github.com/purcell/exec-path-from-shell/pull/79#issuecomment-381283092
   ;;exec-path-from-shell-shell-name "zsh"
   ;;exec-path-from-shell-arguments '()
   )

  (add-to-list 'exec-path "/usr/local/bin") ;; Trying to get Emacs to find the JavaScript tools
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.

  This function is called at the very end of Spacemacs initialization after
  layers configuration. This is the place where most of your configurations
  should be done. Unless it is explicitly specified that a variable should be
  set before a package is loaded, you should place your code here."

  (setq-default line-spacing 3)

  ;; Trying to fix stupid spacemacs
  (require 'tramp)         ;; https://github.com/syl20bnr/spacemacs/issues/9563#issuecomment-330905391
  (require 'helm-bookmark) ;; https://github.com/syl20bnr/spacemacs/issues/9549#issuecomment-327788403


  (setq
   helm-buffers-fuzzy-matching t                        ;; Allow helm to fuzzy search in more places
   ispell-program-name         "/usr/local/bin/ispell"  ;; It forgot where ispell was for some reason
   eslintd-fix-executable      "/usr/local/bin/eslint_d" ;; Oh path...why are you dumb
   javascript-eslint           "/usr/local/bin/eslint"   ;;
   )

  ;; Try to get Emacs to find my eslint for flychecking
  (eval-after-load 'js-mode
    '(add-hook 'js-mode-hook #'add-node-modules-path))

  ;; start a server so new terminal clients can connect
;;  (setq
;   server-use-tcp  t
;;   server-host     "127.0.0.1"
;;   server-port     "6789"
;;   server-auth-dir "~/.emacs.d/server"
;;   server-auth-key "slIDK9lrP>Kgc-Tz{Xx_(lG{m4K]#{E}bvV*?@#p,].=gn~m7.AS%D@pc9DD>;l{")
;;  (require 'server)
;;  (unless (server-running-p)
;;    (server-start))

  ;; Trying to get backward serch working in Ansi-Term again
  ;; https://github.com/syl20bnr/spacemacs/issues/2345#issuecomment-240634646
  (defun bb/setup-term-mode ()
    (evil-local-set-key 'insert (kbd "C-r") 'bb/send-C-r))
  (defun bb/send-C-r ()
    (interactive)
    (term-send-raw-string "\C-r"))
  (add-hook 'term-mode-hook 'bb/setup-term-mode)

  ;; Add the time to the modeline
  (display-time)

  ;; Stop highlighting the current line to make it easier to see what is
  ;; visually selected
  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; Smartparans are never helpful
  (spacemacs/toggle-smartparens-globally-off)

  (setq-default line-spacing 3) ;; I need a bit more elbow room here

  (setq powerline-default-separator 'arrow) ;; No need for fancy pants modeline separators

  ;; Get the natural color title bar
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark)) ;; or dark - depending on your theme

  ;; The default key handling in emacs-mac is different from the official OS X port.
  ;; https://github.com/syl20bnr/spacemacs/issues/222#issuecomment-65953919
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  (setq mac-pass-control-to-system nil)
  (global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
  (global-set-key (kbd "s-v") 'yank)
  (global-set-key (kbd "s-c") 'copy-region-as-kill)

  ;; Bring over the zoom window stuff from vim
  (use-package zoom-window
    :ensure t
    :init
    (custom-set-variables
     '(zoom-window-mode-line-color "#8f3f71"))
    (spacemacs/set-leader-keys
      "zz"  'zoom-window-zoom
      "zn"  'zoom-window-next))

  ;; For some reason this doesn't load when you try to include it as a package
  ;; the standard way.
  ;; (use-package gruvbox-theme
  ;; :ensure t
  ;; :init
  ;; (disable-theme 'spacemacs-dark)
  ;; (disable-theme 'nord)
  ;; (load-theme 'gruvbox t t)

  ;; (custom-theme-set-faces 'gruvbox
  ;;                      '(web-mode-html-attr-custom-face ((t (:slant italic))))
  ;;                      '(web-mode-html-attr-name-face ((t (:slant italic)))))

  ;; (enable-theme 'gruvbox))

  ;; (custom-theme-set-faces 'nord
  ;;                         '(web-mode-html-attr-custom-face ((t (:slant italic))))
  ;;                         '(web-mode-html-attr-name-face ((t (:slant italic)))))


  ;; Use fancy icons in neotree
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))


  ;; Make the title bar a little closer to the background color of gruvbox
  (set-face-background 'scroll-bar "gray59") ;; Get a close to natural title bar color

  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


  ;; org mode setup
  (setq org-default-notes-file "~/org/notes.org"
        org-agenda-files (list "~/org/notes.org"))
  (with-eval-after-load 'org
    (org-babel-do-load-languages 'org-babel-load-languages '(
                                                             (ruby . t)
                                                             (shell . t)
                                                             (js . t)
                                                             (restclient . t)
                                                             )))

  (global-set-key (kbd "M-i") 'popup-imenu)       ;; See the visual representation of the buffer
  (global-set-key (kbd "M-h") 'highlight-symbol)  ;; Toggle highlight on the current symbol

  ;; JavaScript Development Settings
  (setq-default
   js-indent-level 2
   js2-strict-missing-semi-warning nil
   js2-basic-offset 2
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (setq js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        flycheck-disabled-checkers '(javascript-jshint)
        flycheck-checkers '(javascript-eslint))

  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint javascript-standard))
      (flycheck-add-mode checker 'react-mode)
      (flycheck-add-mode checker 'rjsx-mode)))

  (add-hook 'react-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'scss-mode-hook 'flycheck-mode)

  (add-hook 'js2-mode-hook 'eslintd-fix-mode)
  (add-hook 'react-mode-hook 'eslintd-fix-mode)

;;  (setq auto-mode-alist (rassq-delete-all 'react-mode auto-mode-alist))
;;  (use-package rjsx-mode
;;    :ensure t
;;    :init
;;    (add-hook 'rjsx-mode-hook 'flycheck-mode)
;;    (add-hook 'rjsx-mode-hook 'eslintd-fix-mode)
;;    (add-to-list 'auto-mode-alist '("\\.jsx\\" . rjsx-mode)))

  (defun stylelint-fix-file ()
    (interactive)
    (message "stylelint --fix for file " (buffer-file-name))
    (shell-command (concat "stylelint --fix " (buffer-file-name))))

  (defun stylelint-fix-file-and-revert ()
    (interactive)
    (stylelint-fix-file)
    (revert-buffer t t))

  (add-hook 'scss-mode-hook
            (lambda ()
              (add-hook 'after-save-hook #'stylelint-fix-file-and-revert nil 'make-it-local)))

  ;; Scala Settings
  (setq-default flycheck-scalastylerc "/Users/mborc/source/monsanto/scalastyle-config.xml")

  (setq
   scala-indent:align-parameters t
   scala-indent:align-forms      t
   ensime-search-interface       'helm
   sbt:program-name              "/usr/local/bin/sbt"
   )

  ;; ensime was really annoying with the implicit conversions
  (setq markdown-hide-urls nil
        ensime-implicit-gutter-icons nil
        ensime-eldoc-hints 'error
        ensime-graphical-tooltips t
        ensime-auto-generate-config t

        ensime-sem-high-faces '((var . scala-font-lock:var-face)
                                (val . (:inherit font-lock-constant-face :slant italic))
                                (varField . scala-font-lock:var-face)
                                (valField . (:inherit font-lock-constant-face :slant italic))
                                (functionCall . font-lock-function-name-face)
                                (operator . font-lock-keyword-face)
                                (param . (:slant italic))
                                (class . font-lock-type-face)
                                (trait .  (:inherit font-lock-type-face :slant italic))
                                (object . font-lock-constant-face)
                                (package . font-lock-preprocessor-face)
                                (deprecated . (:strike-through "dark gray"))
                                (implicitConversion nil) ;; try overriding ensime-implicit-highlight
                                (implicitParams nil)     ;; instead of redefining all  the faces just
                                                         ;; to makes this change
                                )

        ;; Original faces used when still on Gruvbox
        ;; These can probably be removed and fall back to the default styles based on the theme
        ;; They were overridden t o drop the underlining of the implicit.
        ;; ensime-sem-high-faces '(
        ;;                         (implicitConversion nil)
        ;;                         (implicitParams nil)
        ;;                         (deprecated . (:strike-through "#a9b7c6"))
        ;;                         ;; (var . (:foreground "#ff2222"))
        ;;                         ;; (varField . (:foreground "#ff3333"))
        ;;                         ;; (functionCall . (:foreground "#dc9157"))
        ;;                         ;; (object . (:foreground "#D884E3"))
        ;;                         ;; (operator . (:foreground "#cc7832"))
        ;;                         ;; (object . (:foreground "#6897bb" :slant italic))
        ;;                         ;; (package . (:foreground "yellow"))
        ;;                         )
        )

  (defhydra hydra-neo4j ()
    "neo4j"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))


  (defun vault-secret (path field) "Read a secret from vault"
         (shell-command-to-string (concat "vault read -field=" field " " path)))

  (defun neo4j-password (server-name) "Get the neo4j password from vault"
         (cond ((string-prefix-p "uiqa" server-name) (vault-secret "secret/customer360/nonprod/partyapi/uiqa" "pass"))
               (t (vault-secret "secret/customer360/Identity/nonprod/neo4j" "password"))))

  (defun n4js-connect (server-name)
      "Connect neo4j shell to a server name"
      (setq n4js-cli-program "ssh")
      (setq n4js-cli-arguments
            '("-t"
              (concat "neo-" server-name)
              "cypher-shell"
              "-u" "neo4j"
              "-a" (concat "bolt"
                           (cond ((string-prefix-p "uiqa" server-name) "+routing"))
                           "://localhost:7687")
              "-p" (neo4j-password server-name)))
      (message n4js-cli-arguments)
      (n4js-start))


  (defhydra hydra-buffer-menu (:color pink
                               :hint nil)
  "
  ^uidev^             ^uiqa^
  ^^^^^^^^----------------------------
  _d_: uidev          _q1_: uiqa-c1
  ^ ^:                _q2_: uiqa-c2
  "
    ("d" (n4js-connect "uidev"))
    ("q1" (n4js-connect "uiqa-c1"))
    ("q2" (n4js-connect "uiqa-c2"))
    )



)

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (kaolin-themes doom-modeline docker counsel-projectile counsel autothemer projectile magit pythonic zoom-window yasnippet-snippets yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill toc-org tide tagedit tablist symon swiper subatomic-theme string-inflection sql-indent spaceline-all-the-icons smeargle slim-mode slack shrink-path shell-pop seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe rjsx-mode restclient-helm restart-emacs rbenv rake rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin popup-imenu play-routes-mode pippel pipenv pip-requirements persp-mode password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omnisharp ob-restclient ob-http ob-elixir nord-theme noflet neotree nameless n4js mwim mvn multi-term move-text mmm-mode minitest meghanada maven-test-mode material-theme markdown-toc magithub magit-svn magit-gitflow magit-gh-pulls macrostep lorem-ipsum load-dir livid-mode live-py-mode link-hint json-navigator json-mode js-doc insert-shebang indium indent-guide importmagic impatient-mode idea-darkula-theme hungry-delete hl-todo highlight-symbol highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-git-grep helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag gruvbox-theme groovy-mode groovy-imports gradle-mode google-translate golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md fuzzy font-lock+ flyspell-correct-helm flycheck-mix flycheck-credo flycheck-bashate fish-mode fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu ess-R-data-view eslintd-fix eshell-z eshell-prompt-extras esh-help ensime emoji-cheat-sheet-plus emmet-mode elm-test-runner elm-mode elisp-slime-nav eldoc-eval editorconfig dumb-jump dracula-theme dotenv-mode dockerfile-mode docker-tramp diminish diff-hl define-word dash-at-point dactyl-mode cython-mode csv-mode company-web company-tern company-statistics company-shell company-restclient company-emoji company-emacs-eclim company-anaconda column-enforce-mode color-identifiers-mode clean-aindent-mode chruby centered-cursor-mode bundler browse-at-remote auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile all-the-icons-dired alchemist aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
