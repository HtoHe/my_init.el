 ;; Custom settings(packages)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'zenburn t)

(add-hook 'after-init-hook 'global-company-mode)
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

(require 'evil)
(evil-mode 1)

(global-flycheck-mode)

(evilem-default-keybindings "SPC")

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(require 'helm)
(helm-mode 1)

(require 'company)
(add-to-list 'company-backends 'company-c-headers)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(pdf-tools-install)  ; Standard activation command
(pdf-loader-install) ; On demand loading, leads to faster startup time

(use-package pdf-view-restore
  :after pdf-tools
  :config
  (add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode))

(setq pdf-view-restore-filename "~/.emacs.d/.pdf-view-restore")

 ;; custom setting(ui)
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-10"))

(setq ring-bell-function 'ignore)

;; (global-display-line-numbers-mode 1)
(global-set-key (kbd "C-x /") 'global-display-line-numbers-mode)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-screen t)

(setq initial-frame-alist
      '((top . 1) (left . 1) (width . 130) (height . 40)))


;; custom setting(editing)
(setq-default c-basic-offset 4)

(global-undo-tree-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-undo-system 'undo-tree)
 '(package-selected-packages
   '(pdf-view-restore pdf-tools flycheck-pos-tip company-c-headers evil-easymotion use-package helm flycheck magit avy undo-tree gnu-elpa-keyring-update company zenburn-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
