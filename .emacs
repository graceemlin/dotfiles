(require 'package)
(require 'powerline)
(powerline-default-theme)
(require 'nerd-icons)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.
;; See `package-archive-priorities` and `package-pinned-packages`.
;; Most users will not need or want to do this.
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-operandi-tinted))
 '(custom-safe-themes
   '("afeb7b07dbc1a4cfadb24f3ef6c8cf5e63051bf76411779f03a0fe3aadc07768" "e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" "f4038fbd8cfb731161a36ab07edf672af5d67cfd9dbe35be123ecdaefb04e1c9" "2415b0f51d27e127c8d0980865c79420bc0da21da68d019a09684856320f537f" "5bafdfa3e21f921abf9b9fd77e1e0ce032e62e3a6f8f13ec8ce7945727c654e9" "2628939b8881388a9251b1bb71bc9dd7c6cffd5252104f9ef236ddfd8dbbf74a" "ee29cabce91f27eb1f9540ceb2bb69b4c509cd5d3bb3e6d8ad3a4ab799ebf8f7" "90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" "f149d9986497e8877e0bd1981d1bef8c8a6d35be7d82cba193ad7e46f0989f6a" "58c996beb973f7e988ee4fd21c367b7a5bbdb0622ddfbbd112672a7b4e3d3b81" default))
 '(doc-view-continuous t)
 '(initial-buffer-choice "~/git")
 '(package-selected-packages
   '(nerd-icons package-lint zenburn-theme treemacs spinner rainbow-delimiters projectile package+ nano-theme nano-modeline moe-theme modus-themes melpa-upstream-visit material-theme moe-theme markdown-mode magit kaolin-themes go-mode geiser-stklos geiser-racket geiser-mit geiser-guile f company))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode -1)
(auto-insert-mode t)
(toggle-frame-maximized)
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

(setq geiser-mit-binary "/usr/bin/scheme")
(require 'rainbow-delimiters)
(rainbow-delimiters-mode t)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'display-line-numbers-mode t)
(add-hook 'c++-mode-hook 'rainbow-delimiters-mode)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c++-mode-hook 'display-line-numbers-mode t)
(add-hook 'go-mode-hook 'rainbow-delimiters-mode)
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'display-line-numbers-mode t)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(global-set-key (kbd "M-o") 'ace-window)
