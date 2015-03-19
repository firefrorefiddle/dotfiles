
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

;; Haskell Mode configuration (haskell-mode must be
;; installed through the package manager though
(load-file "~/.emacs.d/haskell-mode.el")

