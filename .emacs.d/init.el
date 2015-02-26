
;; don't ask confirmation when killing client buffers
(add-hook 'server-switch-hook
      (lambda ()
        (when (current-local-map)
          (use-local-map (copy-keymap (current-local-map))))
        (when server-buffer-clients
          (local-set-key (kbd "C-x k") 'server-edit))))

;; Haskell Mode configuration (haskell-mode must be
;; installed through the package manager though
(load-file "~/.emacs.d/haskell-mode.el")

