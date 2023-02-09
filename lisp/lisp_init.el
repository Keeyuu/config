(use-package evil
    :init
    (setq evil-undo-system 'undo-fu)
    :config
    (evil-mode 1)
    (evil-set-leader 'normal (kbd "SPC") nil)    
)

(use-package lsp-ivy :after (lsp-mode))


(use-package projectile
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically t))

(use-package counsel-projectile
  :after (projectile)
  :init (counsel-projectile-mode))


(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (when (daemonp)
  (exec-path-from-shell-initialize))
)
(use-package restart-emacs)
(use-package monokai-theme :config (load-theme 'monokai t))
;; c-x u
(use-package undo-tree :init (global-undo-tree-mode))
;; c-r u
(use-package undo-fu)
;; goto last place
(use-package goto-chg )
;; window 
(use-package ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind (("M-o" . 'ace-window)))
;;which key
(use-package which-key :init (which-key-mode))
;;超级跳转
(use-package avy)
;;minibuff 注释
(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))
;; dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 10)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  (dashboard-setup-startup-hook))
;; 移动块
(use-package drag-stuff :bind (("M-k" . drag-stuff-up) ("M-j" . drag-stuff-down)))
(use-package neotree
             :config
             (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
             (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
             (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
             (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
             (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
             (evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
             (evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
             (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
             (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
)

(use-package treemacs
  :defer t
  :config
  (treemacs-tag-follow-mode)
  (progn (setq treemacs-width                           60))
)

(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package lsp-treemacs
  :ensure t
  :after (treemacs lsp))

;; 增强
(use-package counsel)

(use-package ivy
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  ("M-y" . 'counsel-yank-pop)
   ;;("C-c v" . 'ivy-push-view)
   ;;("C-c s" . 'ivy-switch-view)
   ;;("C-c V" . 'ivy-pop-view)
   ;;("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ;;("C-x C-SPC" . 'counsel-mark-ring)
;;   :map minibuffer-local-map
;;   ("C-r" . counsel-minibuffer-history)
)


;; 命令频率排行
(use-package amx :init (amx-mode))
;; 
(use-package posframe)
;;markdown
(use-package markdown-mode :mode ("README\\.md\\'" . gfm-mode) :init (setq markdown-command "multimarkdown"))
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))

(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t)  ; avoid asking when startup
  (sml/setup)
  :config
  (setq rm-blacklist
    (format "^ \\(%s\\)$"
      (mapconcat #'identity
        '("Projectile.*" "company.*" "Google"
	  "Undo-Tree" "counsel" "ivy" "yas" "WK" "hs" "Lens" "FlyC" "ElDoc")
         "\\|"))))


(require 'keymap)
(require 'lsp)
(provide 'lisp_init)
