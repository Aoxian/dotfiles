;; Turn off some uneeded UI elements
(menu-bar-mode -1)                      ; Don't show the menu bar
(tool-bar-mode -1)                      ; Don't show the tool bar
(scroll-bar-mode -1)                    ; Don't show the scroll bar
(setq inhibit-startup-message t)        ; Don't show the splash screen
(setq use-dialog-box nil)               ; Don't pop up UI dialogs when prompting

;; Turn on some useful UI elements
(global-display-line-numbers-mode 1)   ; Display line numbers in every buffer
(hl-line-mode 1)                       ; Highlights the current line in a buffer

;; Load the Modus Vivendi dark theme
(add-to-list 'load-path "~/.emacs.d/modus-themes")
(require 'modus-themes)
(load-theme 'modus-operandi t t)
(load-theme 'modus-vivendi t t)
(enable-theme 'modus-vivendi)

;; History settings
(recentf-mode 1)                       ; Remember recently edited files
(setq history-length 25)
(savehist-mode 1)                      ; Save minibuffer prompt history
(save-place-mode 1)                    ; Remember and restore the last cursor location of opened files

;; Move customization variable to a seperate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)
