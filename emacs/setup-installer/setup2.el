(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; CONFIGURATIONS
(setq auto-save-default nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-linum-mode)
(setq show-paren-mode t)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(electric-pair-mode)
(smex-initialize)
(windmove-default-keybindings)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


(yas-global-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; font-size 1/10 pt
(set-face-attribute 'default nil :height 105)

;;; Haskell

(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("d9646b131c4aa37f01f909fbdd5a9099389518eb68f25277ed19ba99adeb7279" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(rustic guix geiser-guile emojify-logos magit geiser-racket geiser tuareg fstar-mode lsp-haskell evil idris-mode magic-latex-buffer auctex json-rpc lsp-treemacs yaml-mode helm-swoop csproj-mode gemini-mode lsp-python-ms json-mode lsp-ui smex vlf neotree lsp-mode company-shell emojify web-mode monokai-theme omnisharp material-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(defun ocaml-setup ()
  (interactive)
  (require 'opam-user-setup "~/.emacs.d/opam-user-setup.el"))
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
