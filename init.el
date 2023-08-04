;; UI Settings

;;; Turn off some uneeded UI elements
(menu-bar-mode -1)                      ; Don't show the menu bar
(tool-bar-mode -1)                      ; Don't show the tool bar
(scroll-bar-mode -1)                    ; Don't show the scroll bar
(setq inhibit-startup-message t)        ; Don't show the splash screen
(setq use-dialog-box nil)               ; Don't pop up UI dialogs when prompting

;;; Turn on some useful UI elements
(global-display-line-numbers-mode 1)   ; Display line numbers in every buffer
(hl-line-mode 1)                       ; Highlights the current line in a buffer
(setq visible-bell t)                  ; Use a visual bell


;; History settings
(recentf-mode 1)                       ; Remember recently edited files
(setq history-length 25)
(savehist-mode 1)                      ; Save minibuffer prompt history
(save-place-mode 1)                    ; Remember and restore the last cursor location of opened files


;; Move customization variable to a seperate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)


;; Revert buffers when the underlying files or buffers have changed
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)


;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Package Mgmt

;;; Initialize package sources
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Use Ivy with counsel for completions
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;;; Use which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;;; Helpful
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;;; Spacebar toggles
(use-package general
  :config
  (general-create-definer aoxian/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")
  (aoxian/leader-keys
   "t"  '(:ignore t :which-key "toggles")
   "tt" '(counsel-load-theme :which-key "choose theme")))

;;; Extensible VI Layer
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (evil-mode t)
  :config
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

;;;; Use visual line motions even outside of visual-line-mode-buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;;; Hydra
(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(aoxian/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

;;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Code")
    (setq projectile-project-search-path '("~/Code")))
  (setq projectiel-switch-project-action #'projectile-dired))
(use-package counsel-projectile
  :config (counsel-projectile-mode))

;;; Magit
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
(use-package forge)

;;; Doom Modeline & Themes

;;;; NOTE: the first time you load your configuration on a new machine, you'll
;;;; need to run the following command interactively so that mode line icons
;;;; display correctly:
;;;;
;;;; M-x all-the-icons-install-fonts
(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))
(use-package doom-themes)


;; Modus Theme config

;;; Use latest version of modus themes
(add-to-list 'load-path "~/.config/emacs/modus-themes")
(require 'modus-themes)

;;; Theme Customizations
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t
      modus-themes-org-blocks 'gray-background)

;;;; Palette Overrides
(setq modus-themes-common-palette-overrides

;;;;; Mode Line
      '((bg-mode-line-active bg-blue-subtle)
	(fg-mode-line-active fg-main)
	(border-mode-line-active bg-mode-line-active)
	(border-mode-line-inactive bg-mode-line-inactive)

;;;;; Selection regions
	(bg-region bg-dim)
	(fg-region blue-cooler)

;;;;; Parentesis matching
	(bg-paren-match blue-cooler)))

;;;; Headings
(setq modus-themes-headings
      '((1 . (rainbow 1.4))
	(2 . (rainbow 1.3))
	(3 . (rainbow bold 1.2))
	(t . (semilight 1.1))))

;;; Load Light and Dark themes
(load-theme 'doom-palenight :no-confirm)

;;; define <F5> to switch themes
(define-key global-map (kbd "<f5>") #'counsel-load-theme)


;; Keep files clean
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/autosaves/sessiosns/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

(setq projectile-know-projects-file (expand-file-name "tmp/projectile-bookmarks.eld" user-emacs-directory)
      lsp-session-file (expand-file-name "tmp/.lsp-session-v1" user-emacs-directory))

(setq user-emacs-directory (expand-file-name "~/.cache/emacs"))
