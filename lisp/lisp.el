(provide 'lisp);;; init.el ends here


(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-enable-imenu-support t
)

; package-install 按下回车 -> 后输入 "use-package"
(eval-when-compile
  (require 'use-package)
)

;这个插件可以记录我们每次调用 M-x 时输入的命令历史，然后每次将最常用的显示在前面
(use-package amx
  :init (amx-mode)
)
;;   (ivy-mode 1)
;;   (counsel-mode 1)
(use-package ivy-posframe)

(use-package ivy 
  :defer nil 
  :demand
  :hook (after-init . ivy-mode)
  :config 
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t 
        ivy-initial-inputs-alist nil 
        ivy-count-format "%d/%d " 
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  ;; (ivy-posframe-mode 1)
)

(use-package counsel 
  :after (ivy)
  :config
  ;; 将 minibuffer 移动到屏幕中央
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((left-fringe . 10)
                                  (right-fringe . 10)
				  )
  )
  (ivy-posframe-mode 1)
)

(use-package swiper 
  :after ivy 
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t
          )
)



(use-package counsel-projectile
  :after (projectile)
  :init (counsel-projectile-mode)
)

; c-x u
(use-package undo-tree
  :init (global-undo-tree-mode)
)

(use-package which-key
  :init (which-key-mode)
)
; minibuffer 中的选项添加注解的插件
(use-package marginalia
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
			  ("M-A" . marginalia-cycle)
        )
)

(use-package all-the-icons)

(use-package dashboard
  :defer nil
  :config
  (setq dashboard-banner-logo-title "西北望，射天狼") ;; 个性签名，随读者喜好设置
  (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'logo) ;; 也可以自定义图片
  (setq dashboard-center-content t) ;; 将 Dashboard 内容居中显示
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-items '(
              (recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10)    ;; 显示多少个最近项目
			;;   (agenda . 5)
			;;   (registers . 5)
			  )
  )
  (dashboard-setup-startup-hook)
)

; 多级括号
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
)

;project 
(use-package projectile
  :defer nil
  :init(projectile-mode)
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically t)
)
;
(use-package smart-mode-line-atom-one-dark-theme)

(use-package smart-mode-line
  :defer nil
  :init
  (setq sml/no-confirm-load-theme t)
  (setq sml/theme 'atom-one-dark)
  (sml/setup)
  :config
  (setq rm-blacklist
    (format "^ \\(%s\\)$"
      (mapconcat #'identity
        '("Projectile.*" "company.*" "Google" "ivy-posframe" "橋" "super-save"
	  "Undo-Tree" "counsel" "ivy" "yas" "WK" "hs" "Lens" "FlyC*" "ElDoc"
         )
         "\\|"
      )
    )
  )
)

(use-package restart-emacs)

(use-package monokai-theme 
    :defer nil
    :config 
    (load-theme 'monokai t)
)

;; goto last place
(use-package goto-chg)

;;超级跳转
(use-package avy)

					;
(use-package vterm)
(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode 0)))

;; 类似于ranger
(use-package ranger)






(defun my/split-window-below-third ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (enlarge-window (floor (* 0.3 (window-text-height)))))

(global-set-key (kbd "C-x 2") 'my/split-window-below-third)
;; (global-prettify-symbols-mode +1)
;; ;; 符号替换
;; (add-hook 'after-change-major-mode-hook
;;           (lambda ()
;;             (setq prettify-symbols-alist
;;                   '(
;; 		    ("!=" . ?≠)
;; 		    ("!==" . ?≢)
;; 		    ("===" . ?≡)
;; 		    ("<=" . ?≤)
;;                     (">=" . ?≥)
;;                     ("->" . ?⇾)
;;                     ("<-" . ?⇽)
;;                     ("&&" . ?∧)
;;                     ("||" . ?∨)
;; 		    )
;; 		  )
;;             (prettify-symbols-mode)))

