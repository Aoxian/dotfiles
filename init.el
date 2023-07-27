;; UI Settings

;;;; Turn off some uneeded UI elements
(menu-bar-mode -1)                      ; Don't show the menu bar
(tool-bar-mode -1)                      ; Don't show the tool bar
(scroll-bar-mode -1)                    ; Don't show the scroll bar
(setq inhibit-startup-message t)        ; Don't show the splash screen
(setq use-dialog-box nil)               ; Don't pop up UI dialogs when prompting


;;;; Turn on some useful UI elements
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
(load-theme 'modus-vivendi :no-confirm)

;;; define <F5> to toggle between light and dark themes
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)


;; Keep files clean
(setq backup-directory-alist `(("." . ,(expand-file-name "tmp/backups/" user-emacs-directory))))

(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/autosaves/sessiosns/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

(setq projectile-know-projects-file (expand-file-name "tmp/projectile-bookmarks.eld" user-emacs-directory)
      lsp-session-file (expand-file-name "tmp/.lsp-session-v1" user-emacs-directory))

(setq user-emacs-directory (expand-file-name "~/.cache/emacs"))
