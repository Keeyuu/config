
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ;
;; (add-to-list 'load-path (expand-file-name "cmp" user-emacs-directory)) ; 设定源码加载路径


(set-face-attribute 'default nil :font"MesloLGL Nerd Font Mono 13")



(require 'package)
(setq package-archives '(
  ("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
  ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  )
)

(setq url-proxy-services '(
  ("no_proxy" . "^\\(192\\.168\\..*\\)")
  ("http" . "127.0.0.1:7891")
	("https" . "127.0.0.1:7891")
  )
)

(package-initialize) 


(add-to-list 'default-frame-alist '(fullscreen . fullboth));全屏

(prefer-coding-system 'utf-8)
(defalias 'yes-or-no-p 'y-or-n-p)
;; (setq confirm-kill-emacs #'yes-or-no-p)      ; 在关闭 Emacs 前询问是否确认关闭，防止误触

(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(column-number-mode t)                       ; 在 Mode line 上显示列号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面

(setq make-backup-files nil)                 ; 关闭文件自动备份 和下面的区别就是命名格式不一样
(auto-save-visited-mode 1)
(setq auto-save-visited-file-name "~/.emacs.d/.back/") ;修改文件时自动保存备份
;(auto-save-mode 1);内置的功能不是那么完善
(use-package super-save
  :ensure t
  :defer nil
  :config;失去焦点自动保存
  (super-save-mode +1)
)

(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(global-display-line-numbers-mode 1)         ; 在 Window 显示行号
(tool-bar-mode -1)                           ; （熟练后可选）关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(setq display-line-numbers-type 'relative)   ; （可选）显示相对行号
(add-to-list 'default-frame-alist '(width . 180)) ; （可选）设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 55)) ; （可选）设定启动图形界面时的初始 Frame 高度（字符数）


(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
  )
  (when (daemonp) (exec-path-from-shell-initialize)
  )
)

(require 'lisp);这个必须第一
(require 'lsp)
(require 'cmp)
(require 'keymap)




(provide 'init);;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4b287bfbd581ea819e5d7abe139db1fb5ba71ab945cec438c48722bea3ed6689" default))
 '(package-selected-packages
   '(org project which-key vterm rust-mode markdown-mode marginalia evil dash counsel amx go-mode exec-path-from-shell flycheck ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
