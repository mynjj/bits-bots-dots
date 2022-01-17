; mynjj8832's emacs config

;;;;;;;;;;;;;;;;;;;;;; ENABLERS
; To download packages and install them; ELPA is as specification repos follow
(require 'package)
(setq package-archives
      '(
	("elpa" . "https://elpa.gnu.org/packages/") ; official but small
	("melpa" . "https://melpa.org/packages/") ; unofficial but large
	))

; Load installed packages
(package-initialize)

; TODO: define package update process
; (package-refresh-contents)
(unless package-archive-contents (package-refresh-contents))

;;;;;;;;;;;;;;;;;;;;;; UX
; Disables showing default *GNU Emacs* buffer
; I really don't like it...
(setq inhibit-startup-message t)
; No scroll bars on buffers
(scroll-bar-mode -1)
; No menubar
(menu-bar-mode -1)
; No toolbar
(tool-bar-mode -1)
; No tooltips (messages on the modeline)
(tooltip-mode -1)
; Might not be practical, but I like a light transparency
; 'alpha accepts a cons cell for different opacities,
; with (active inactive) as values

; Sets it on the current frame
(set-frame-parameter (selected-frame) 'alpha '(90 80))
; Sets it as default for new frames
(add-to-list 'default-frame-alist '(alpha 90 80))

;;;;;;;;;;;;;;;;;;;;;; TEXT EDITING
(column-number-mode)

(global-display-line-numbers-mode t)
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;;;;;;;;;;;;;;;;;;;;; EXTERNAL PACKAGES
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t ; downloads when `true`
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      )

;;;;;;;;;;; EMACS USABILITY
; which-key shows in a popup the possible shortcuts available, it's quite nice
(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 1))

; ivy, a completion mechanism
(use-package ivy
  :diminish
  :config
  (ivy-mode 1)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))) ; TODO: tweak completion algs to use for different things, this one is too fuzzy

; TODO: consider ivy-rich

; counsel gives ivy-versions for emacs commands
(use-package counsel
  :config
  (counsel-mode 1))

; I am evil
(use-package evil
  :init
  ; evil-collection assumptions
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config (evil-mode 1))
; more evil keybindings for other modes
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

; projectile, project manager
(use-package projectile
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap ("C-c p" . projectile-command-map))

;;;;;;;;;;; DEVELOPMENT
; magit, a git porcelain
(use-package magit)

;;;;;;;;;;;;;;;;;;;;;; EMACS MANAGED

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile evil-collection evil counsel ivy which-key use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
