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
   '("712dda0818312c175a60d94ba676b404fc815f8c7e6c080c9b4061596c60a1db" "afeb7b07dbc1a4cfadb24f3ef6c8cf5e63051bf76411779f03a0fe3aadc07768" "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" "f4038fbd8cfb731161a36ab07edf672af5d67cfd9dbe35be123ecdaefb04e1c9" "2415b0f51d27e127c8d0980865c79420bc0da21da68d019a09684856320f537f" "5bafdfa3e21f921abf9b9fd77e1e0ce032e62e3a6f8f13ec8ce7945727c654e9" "2628939b8881388a9251b1bb71bc9dd7c6cffd5252104f9ef236ddfd8dbbf74a" "ee29cabce91f27eb1f9540ceb2bb69b4c509cd5d3bb3e6d8ad3a4ab799ebf8f7" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" "58c996beb973f7e988ee4fd21c367b7a5bbdb0622ddfbbd112672a7b4e3d3b81" default))
 '(doc-view-continuous t)
 '(initial-buffer-choice "~/git")
 '(package-selected-packages
   '(geiser nerd-icons package-lint zenburn-theme treemacs spinner rainbow-delimiters projectile package+ nano-theme nano-modeline moe-theme modus-themes melpa-upstream-visit material-theme moe-theme markdown-mode magit kaolin-themes go-mode geiser-stklos geiser-racket geiser-mit geiser-guile f company))
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

;; Eglot (LSP)
(use-package eglot
  :hook ((c-mode c++-mode) . eglot-ensure))

;; Company (Completion)
(use-package company
  :after lsp-mode
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0))

;; Powerline
(use-package powerline
  :demand t ;
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
