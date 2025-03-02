;; Package Management
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Basic settings
(setq inhibit-startup-message t)
         
(menu-bar-mode 1)              
(auto-insert-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)      
(setq display-line-numbers-mode t)
(toggle-frame-maximized)

;; Custom settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi-tinted))
 '(custom-safe-themes
   '("712dda0818312c175a60d94ba676b404fc815f8c7e6c080c9b4061596c60a1db" default))
 '(doc-view-continuous t)
 '(initial-buffer-choice "~/git")
 '(package-selected-packages
   '(eat org-contrib auctex sml-mode sly lua-mode json-mode haskell-mode diff-hl consult corfu dape geiser nerd-icons package-lint zenburn-theme treemacs spinner rainbow-delimiters projectile package+ nano-theme nano-modeline moe-theme modus-themes melpa-upstream-visit material-theme moe-theme markdown-mode magit kaolin-themes go-mode geiser-stklos geiser-racket geiser-mit geiser-guile f company))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Auto-insert skeletons
(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C++ skeleton")
     '(\n
       "#include <bits/stdc++.h>" \n \n
       "using namespace std;" \n \n
       "int main(int argc, char* argv[]) {" \n
       "ios::sync_with_stdio(0)\;" \n
       "cin.tie(0)\;" \n
       > _ \n
       "}" > \n)))

(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.c\\'" . "C skeleton")
     '(\n
     "#include <stdio.h>" \n
       "int main(){" > \n
       > _ \n
       "}" > \n)))

(eval-after-load 'autoinsert
  '(define-auto-insert '("\\.go\\'" . "Go skeleton")
     '(\n
     "package main\;" \n
       "import \"fmt\"\;" \n
       "func main(){" > \n
       > _ \n
       "}" > \n)))

;; Geiser
(setq geiser-mit-binary "/usr/bin/scheme")

;; Rainbow Delimiters
(use-package rainbow-delimiters)

;; Company (Completion)
(use-package company
  :after lsp-mode
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0))

;; Eglot (LSP)
(use-package eglot
  :hook ((c-mode c++-mode) . eglot-ensure))

;; Powerline
(use-package powerline
  :demand t
  :config
  (powerline-default-theme))

;; Nerd Icons
(use-package nerd-icons
  :ensure t)

;; Treemacs
(use-package treemacs
  :config
  (add-hook 'after-init-hook 'treemacs))

;; Programming modes
(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode t)
            (company-mode)
            (rainbow-delimiters-mode)))

;;; Package Configuration
(use-package avy
  :bind ("C-c z" . #'avy-goto-word-1))

(use-package magit
  :bind ("C-c g" . #'magit-status)
  :config
  (setq magit-diff-refine-hunk t))

(use-package eat
  :config
  (setq eat-kill-buffer-on-exit t)
  (setq eat-enable-mouse t))

(use-package consult
  :config
  (setq read-buffer-completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)
  (setq completion-ignore-case t))

(use-package diff-hl
  :hook
  (prog-mode . diff-hl-mode))

(use-package auctex
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-master nil)
  :hook
  (latex-mode . #'LaTeX-math-mode)
  (latex-mode . #'reftex-mode))

(use-package markdown-mode)

(use-package org
  :bind ("C-c l" . #'org-store-link)
  :bind ("C-c a" . #'org-agenda))

(use-package org-contrib)

;;; Miscellaneous Options
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))

(setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)
