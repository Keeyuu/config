;;; path

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设定源码加载路径


(set-face-attribute 'default nil :font"MesloLGL Nerd Font Mono 13")



(require 'package)
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq url-proxy-services '(("no_proxy" . "^\\(192\\.168\\..*\\)")
                           ("http" . "127.0.0.1:7890")
			               ("https" . "127.0.0.1:7890")))
(package-initialize) 

(eval-when-compile
  (require 'use-package))
;; `use-package-always-ensure' 避免每个软件包都需要加 ":ensure t" 
;; `use-package-always-defer' 避免每个软件包都需要加 ":defer t" 
(setq use-package-always-ensure t
    ;;  use-package-always-defer t
      use-package-enable-imenu-support t
      use-package-expand-minimally t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触
(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
(setq make-backup-files nil)                 ; 关闭文件自动备份
(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)         ; 在 Window 显示行号
(tool-bar-mode -1)                           ; （熟练后可选）关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(setq display-line-numbers-type 'relative)   ; （可选）显示相对行号
(add-to-list 'default-frame-alist '(width . 180))  ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）



;;;;;;;;
(require 'lisp_init)
;;;;;;;;




(provide 'init);;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))
 '(max-lisp-eval-depth 2000)
 '(package-selected-packages
   '(lsp-treemacs treemacs-projectile treemacs rust-mode lsp-ui counsel-projectile projectile yasnippet-snippets which-key websocket web-server use-package-hydra undo-tree undo-fu smart-mode-line restart-emacs rainbow-delimiters posframe neotree monokai-theme marginalia lsp-ivy hydra go-mode flycheck evil drag-stuff dashboard counsel company-tabnine company-box amx ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
