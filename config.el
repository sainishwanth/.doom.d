;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.

;;(setq user-full-name "Sai Nishwanth Raj"
;;      user-mail-address "Sainishwanthraj@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:


(setq doom-theme 'doom-tomorrow-night)
;; This determines therstyle of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq menu-bar-mode nil
      tool-bar-mode nil)

 (add-hook! '+doom-dashboard-functions :append (insert "\n" (+doom-dashboard--center +doom-dashboard--width "               “Debugging is twice as hard as writing the code.
                Therefore, if you write the code as cleverly as possible, you are,
                by definition, not smart enough to debug it.”
                — Brian W. Kernighan.")))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! centaur-tabs
  (setq centaur-tabs-set-bar 'right))
(setq doom-themes-treemacs-theme "doom-colors")

;;(setq doom-theme 'doom-wilmersdorf)
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
)

(setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

(display-time-mode)
(display-battery-mode)

(require 'org-bullets)(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(add-to-list 'auto-mode-alist '("\\.\\(cbr\\)\\'" . archive-mode))
(map! :leader
      :desc "Centaur Tabs -> Right"
      "k" #'centaur-tabs-forward)

(map! :leader
      :desc "Centaur Tabs -> Left"
      "j" #'centaur-tabs-backward)

(map! :leader
      :desc "emms-open"
      "e m" #'emms)
(map! :leader
      :desc "emms-random"
      "e r" #'emms-random)

(map! :leader
      :desc "emms-next"
      "e n" #'emms-next)
(map! :leader
      :desc "emms-pause"
      "e x" #'emms-pause)

(map! :leader
      :desc "emms-previous"
      "e p" #'emms-previous)

(map! :leader
      :desc "emms-start"
      "e s" #'emms-start)
(use-package org-roam
          :ensure t
          :init
          (setq org-roam-v2-ack t)
          :custom
          (org-roam-directory "~/Documents/College/Semester-6/Notes/Org-Files/")
          :bind
          (("C-c r l" . org-roam-buffer-toggle)
           ("C-c r f" . org-roam-node-find)
           ("C-c r i" . org-roam-node-insert))
          :config
          (org-roam-setup))
;; Dashboard.el config
;;(use-package dashboard
;;  :ensure t
;;  :config
;;  (dashboard-setup-startup-hook))
;;(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;;;; Set the title
;;(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;;;; Set the banner
;;(setq dashboard-startup-banner 1)
;;;; Value can be
;;;; - nil to display no banner
;;;; - 'official which displays the official emacs logo
;;;; - 'logo which displays an alternative emacs logo
;;;; - 1, 2 or 3 which displays one of the text banners
;;;; - "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer
;;;; - a cons of '("path/to/your/image.png" . "path/to/your/text.txt")
;;
;;;; Content is not centered by default. To center, set
;;(setq dashboard-center-content t)
;;
;;;; To disable shortcut "jump" indicators for each section, set
;;(setq dashboard-show-shortcuts nil)
;;(setq dashboard-items '((recents  . 5)
;;                        (bookmarks . 5)
;;                        (projects . 5)
;;                        (agenda . 5)
;;                        (registers . 5)))
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
(add-hook 'rust-mode-hook 'lsp-deferred)
  (setq lsp-pyright-use-library-code-for-types t) ;; set this to nil if getting too many false positive type errors
  (setq lsp-pyright-stub-path (concat (getenv "HOME") "/src/python-type-stubs")) ;; example
;;(after! doom-themes
;;  (load-theme 'doom-nano-dark t))
(setq display-line-numbers-type 'relative)
(require 'evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(solaire-global-mode +1)
(setq frame-resize-pixelwise 5)
(require 'evil-multiedit)
(evil-multiedit-default-keybinds)
(save-place-mode 1)
(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(elcord-mode)
(use-package! hydra
  :defer
  :config
  (defhydra hydra/evil-window-resize (:color red)
    "Resize window"
    ("h" evil-window-decrease-width "decrease width")
    ("j" evil-window-decrease-height "decrease height")
    ("k" evil-window-increase-height "increase height")
    ("l" evil-window-increase-width "increase width")
    ("q" nil "quit")))
(map! :leader
      :prefix ("w" . "window")
      :n "r" #'hydra/evil-window-resize/body)
