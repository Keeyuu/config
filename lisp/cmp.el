(provide 'cmp)

;; (use-package company
;;   :init (global-company-mode)
;;   :config
;;   (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
;;   (setq company-tooltip-align-annotations t)
;;   (setq company-idle-delay 0.0)
;;   (setq company-show-numbers t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
;;   (setq company-selection-wrap-around t)
;;   (setq company-transformers '(company-sort-by-occurrence))
;; ) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉

;; ;;显示图标
;; (use-package company-box
;;   :if window-system
;;   :hook (company-mode . company-box-mode)
;; )

;; ;;随后，重启 Emacs，输入命令：M-x company-tabnine-install-binary，来安装 TabNine 的后台程序。之后就可以正常使用了。但是总的来说，AI 插件会导致偶尔的高 CPU 占用，如果电脑硬件性能不佳，建议尽量关闭后台训练功能，或者是直接使用传统补全插件就好。
;; ;Tip 1：想要打开 TabNine 的设置页面只需要在任意位置输入：tabnine::config，随后会弹出一个浏览器窗口显示 TabNine 的相关设置。
;; ;Tip 2：TabNine 学生认证可以免费获得 TabNine Pro 的使用资格，包括更多的备选项等。
;; (use-package company-tabnine
;;   :init (add-to-list 'company-backends #'company-tabnine)
;; )


