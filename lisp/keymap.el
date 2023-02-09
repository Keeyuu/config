
;;; package --- keymap
;;; Commentary:
;;; code:
;; vim mode

(global-set-key (kbd "C-p") 'universal-argument)
(evil-define-key '(normal visual insert replace operator motion emacs) 'global (kbd "C-p") 'universal-argument)

(global-set-key (kbd "C-u") 'evil-scroll-page-up)
(global-set-key (kbd "C-d") 'evil-scroll-page-down)


(define-key evil-normal-state-map (kbd "TAB") 'evil-jump-to-tag)

(evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)

(define-key evil-normal-state-map (kbd "/") 'swiper)
(define-key evil-normal-state-map (kbd ":") 'counsel-M-x )
;;-----f-----
(define-key evil-normal-state-map (kbd "<leader>ff") 'counsel-find-file )
;;-----m-----
(define-key evil-normal-state-map (kbd "<leader>mj") 'counsel-bookmark )
(define-key evil-normal-state-map (kbd "<leader>md") 'bookmark-delete )
;;-----b-----
(define-key evil-normal-state-map (kbd "<leader>b") 'ivy-switch-buffer)
;;-----x-----
(define-key evil-normal-state-map (kbd "<leader>xc") 'capitalize-word)
(define-key evil-normal-state-map (kbd "<leader>xu") 'upcase-word)
(define-key evil-normal-state-map (kbd "<leader>xl") 'downcase-word)
;;-----j-----
(global-set-key (kbd "<leader>jj") 'avy-goto-char-timer)
(global-set-key (kbd "<leader>jl") 'goto-last-change)
;;-----p-----
(define-key evil-normal-state-map (kbd "<leader>p") 'projectile-command-map)
;;-----l-----
;;(define-key evil-normal-state-map (kbd "<leader>lj") 'projectile-find-tag)
(define-key evil-normal-state-map (kbd "<leader>lf") 'lsp-format-buffer)
(define-key evil-normal-state-map (kbd "<leader>lr") 'lsp-find-references)
(define-key evil-normal-state-map (kbd "<leader>ls") 'lsp-ui-doc-toggle)
;;-----w----
(define-key evil-normal-state-map (kbd "<leader>wh") 'split-window-horizontally)
(define-key evil-normal-state-map (kbd "<leader>wv") 'split-window-vertically)
(define-key evil-normal-state-map (kbd "<leader>wq") 'kill-buffer-and-window)
;;-----h----
(define-key evil-normal-state-map (kbd "<leader>h") 'undo-tree-visualize)
;;-----t----
(define-key evil-normal-state-map (kbd "M-0") 'treemacs-select-window)
(define-key evil-normal-state-map (kbd "<leader>tp") 'treemacs)
(define-key evil-normal-state-map (kbd "<leader>tt") 'neotree-find)
(define-key evil-normal-state-map (kbd "<leader>tn") 'treemacs-project)
;;-----g----
(define-key evil-normal-state-map (kbd "<leader>gh") 'vc-annotate)
;;-----r----
(define-key evil-normal-state-map (kbd "<leader>rs") 'query-replace)
(define-key evil-normal-state-map (kbd "<leader>rr") 'query-replace-regexp)


;;
(provide 'keymap) ; 意为“导出本模块，名为 hello”。这样就可以在其它地方进行 require
