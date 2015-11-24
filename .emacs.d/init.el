
;; don't ask confirmation when killing client buffers
(add-hook 'server-switch-hook
      (lambda ()
        (when (current-local-map)
          (use-local-map (copy-keymap (current-local-map))))
        (when server-buffer-clients
          (local-set-key (kbd "C-x k") 'server-edit))))

;; MELPA repository packages
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

;; Haskell Mode configuration (haskell-mode must be
;; installed through the package manager though
(load-file "~/.emacs.d/haskell-mode.el")

;; set SBCL as SLIME lisp
(setq inferior-lisp-program (executable-find "sbcl"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((haskell-process-use-ghci . t) (haskell-indent-spaces . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)

(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.m\\'" . mercury-mode))

(eval-after-load 'flycheck
  '(require 'flycheck-mercury))

(add-hook 'after-init-hook #'global-flycheck-mode)

