;;; package --- lsp
;;; Commentary:
;;; code:
(use-package flycheck
  :hook                        ; 为模式设置 hook
  (prog-mode . flycheck-mode))


(use-package rust-mode)

;; 自动补全company + lsp-mode
(use-package company
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length 1) ; 只需敲 1 个字母就开始进行自动补全
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-quick-access t) ;; 给选项编号 (按快捷键 M-1、M-2 等等来进行选择).
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))) ; 根据选择的频率进行排序，读者如果不喜欢可以去掉
 
;; 上面的图标
(use-package company-box
  :if window-system
  :hook (company-mode . company-box-mode))

;; tabnine
(use-package company-tabnine
  :init (add-to-list 'company-backends #'company-tabnine))

;;lsp
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (defun lsp-save-actions ()
    "LSP actions before save."
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
	(add-hook 'before-save-hook #'lsp-format-buffer t t))
  :hook ((lsp-mode . #'lsp-enable-which-key-integration)
         (lsp-mode . #'lsp-save-actions)
         ((c-mode
           c++-mode
           go-mode
           js-mode
           python-mode
           rust-mode
           web-mode) . lsp-deferred))
  :config
  (setq lsp-auto-guess-root t
	    lsp-headerline-breadcrumb-enable nil
	    lsp-keymap-prefix "C-c l"
	    lsp-log-io nil)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-position 'top))

(use-package yasnippet
  :init
  (yas-reload-all)
  :hook
  (prog-mode . yas-minor-mode)
  :config
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  ;;(define-key yas-minor-mode-map [(tab)]        nil)
  ;;(define-key yas-minor-mode-map (kbd "TAB")    nil)
  ;;(define-key yas-minor-mode-map (kbd "<tab>")  nil)
  ;:bind
  ;(:map yas-minor-mode-map ("S-<tab>" . yas-expand)))

(use-package yasnippet-snippets :after yasnippet)
)

(provide 'lsp)
