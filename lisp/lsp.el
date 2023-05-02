(provide 'lsp)
;; (use-package flycheck
;;   :defer nil
;;   :config
;;   (setq truncate-lines t) ; 如果单行信息很长会自动换行
;;   :hook
;;   (prog-mode . flycheck-mode)
;; )

;; (use-package flycheck-rust
;;     :config
;;     (with-eval-after-load 'rust-mode (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
;; )
;-----------------------lsp-bridge------------------------------------
(use-package go-mode)
(use-package rust-mode)
(use-package posframe)
(use-package js2-mode)

(use-package markdown-mode
  :init (setq markdown-command "multimarkdown")
)


;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

(add-to-list 'load-path "/Users/keeyu/code/github/lsp-bridge")
; 手动安装
(use-package yasnippet)

(yas-global-mode 1)

(require 'lsp-bridge)

(global-lsp-bridge-mode)

(setq acm-enable-quick-access t) ;数字快速选择
(setq acm-enable-icon t) ;ui
(setq acm-enable-tabnine t) ;ai
(setq lsp-bridge-enable-auto-format-code t);自动格式化
(setq lsp-bridge-python-lsp-server 'pylsp);py lsp
;; (setq lsp-bridge-python-command "/opt/homebrew/Caskroom/miniconda/base/bin/python3");py lsp
(setq lsp-bridge-enable-hover-diagnostic t);鼠标悬停
;-------------------------------------------------------
;; ;https://www.flycheck.org/en/latest/languages.html#flycheck-languages


;; (use-package flymake
;;   :hook (prog-mode . flymake-mode)
;;   :config
;;   (global-set-key (kbd "M-n") #'flymake-goto-next-error)
;;   (global-set-key (kbd "M-p") #'flymake-goto-prev-error))

;lsp lsp-install-server
;; (use-package lsp-mode
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l"
;; 	lsp-file-watch-threshold 500
;;   )
;;   :hook 
;;   (lsp-mode . lsp-enable-which-key-integration) ; which-key integration
;;   :commands (lsp lsp-deferred)
;;   :config
;;   (setq lsp-completion-provider :none) ;; 阻止 lsp 重新设置 company-backend 而覆盖我们 yasnippet 的设置
;;   (setq lsp-headerline-breadcrumb-enable t)
;;   :bind
;;   ("C-c l s" . lsp-ivy-workspace-symbol) ;; 可快速搜索工作区内的符号（类名、函数名、变量名等）
;; ) 

;; ;;利用 ivy 辅助 lsp
;; (use-package lsp-ivy
;;   :after (lsp-mode)
;; )
