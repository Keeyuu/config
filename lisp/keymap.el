
(use-package undo-fu)
(use-package drag-stuff)
(use-package evil-surround)
(use-package evil
    :defer nil
    :ensure t
    :init
    (setq evil-undo-system 'undo-fu)
    :config
    (evil-mode 1)
    (evil-surround-mode 1)
    (evil-set-leader 'normal (kbd "SPC") nil) 
    (setcdr evil-insert-state-map nil)  ;关闭insert 模式键位
    (evil-set-initial-state 'dashboard-mode 'insert);首页下默认insert
    (define-key evil-insert-state-map [escape] 'evil-normal-state);esc 退出 insert模式
    (define-key evil-normal-state-map (kbd ":") 'counsel-M-x)
    (define-key evil-normal-state-map (kbd "/") 'swiper)
    (define-key evil-normal-state-map (kbd "<leader>p") 'projectile-command-map);;项目相关前缀
    ;lsp
    (evil-define-key '(normal) 'global (kbd "TAB") 'lsp-bridge-find-def);跳转
    (evil-define-key '(normal) 'global (kbd "S-<tab>") 'lsp-bridge-find-def-other-window);窗口跳转
    (evil-define-key '(normal) 'global (kbd "K") 'lsp-bridge-popup-documentation);显示信息
    (evil-define-key '(normal) 'global (kbd "<leader>lrn") 'lsp-bridge-rename);
    (evil-define-key '(normal) 'global (kbd "<leader>lrr") 'lsp-bridge-find-references);
    (evil-set-initial-state 'lsp-bridge-ref-mode 'insert);引用模式下默认insert
    (evil-define-key '(normal) 'global (kbd "<leader>lj") 'lsp-bridge-diagnostic-jump-next);
    (evil-define-key '(normal) 'global (kbd "<leader>lk") 'lsp-bridge-diagnostic-jump-prev);
    (evil-define-key '(normal) 'global (kbd "<leader>ll") 'lsp-bridge-diagnostic-list);
    (evil-define-key '(normal) 'global (kbd "<leader>lf") 'lsp-format-buffer);
    (evil-define-key '(normal) 'global (kbd "<leader>la") 'lsp-bridge-code-action);
    (evil-define-key '(normal) 'global (kbd "<leader>lc") 'counsel-flycheck);
    ;;-----m-----
    (define-key evil-normal-state-map (kbd "<leader>mj") 'counsel-bookmark )
    (define-key evil-normal-state-map (kbd "<leader>md") 'bookmark-delete )
    ;;-----j-----
    (evil-define-key '(normal visual) 'global (kbd "<leader>j") 'avy-goto-char-timer);超级jump
    ;;-----move-----
    (evil-define-key '(normal visual) 'global (kbd "M-p") 'drag-stuff-up);向上移动行)
    (evil-define-key '(normal visual) 'global (kbd "M-n") 'drag-stuff-down);向下移动行)
    (evil-define-key '(normal visual) 'global (kbd "M-f") 'indent-rigidly-right);向下移动行)
    (evil-define-key '(normal visual) 'global (kbd "M-b") 'indent-rigidly-left);向下移动行)
    (defun next-ten-lines()
    "Move cursor to next 10 lines."
    (interactive)
    (next-line 10))
    (defun previous-ten-lines()
    "Move cursor to previous 10 lines."
    (interactive)
    (previous-line 10))
    (evil-define-key '(normal visual) 'global (kbd "C-n") 'next-ten-lines);向下移动行)
    (evil-define-key '(normal visual) 'global (kbd "C-p") 'previous-ten-lines);向上移动行)
    ;;-----s-----
    (evil-define-key '(normal) 'global (kbd "<leader>sr") 'counsel-buffer-or-recentf);选buff
    (evil-define-key '(normal) 'global (kbd "<leader>ss") 'counsel-rg);选buff
    ;;(define-key evil-normal-state-map (kbd "<leader>lj") 'projectile-find-tag)
)



(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-r") 'swiper-isearch-backward)
(global-set-key (kbd "s-/") 'comment-line);注释 默认M-;
(global-set-key (kbd "M-;") 'comment-line);注释 默认M-;
(global-set-key (kbd "C-x b") 'ivy-switch-buffer) ;选buff


(provide 'keymap)
