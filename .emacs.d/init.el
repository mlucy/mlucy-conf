(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(add-hook 'lisp-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(setq-default show-trailing-whitespace t)

(global-set-key (kbd "C-x C-b") 'iswitchb-buffer)

;;(run-with-idle-timer 1 t '(lambda () (font-lock-fontify-buffer)))
;(setf timer-idle-list nil)
(global-set-key (kbd "M-?") 'ascope-find-this-symbol)
(fset 'tst "\C-[xcompilation-next-error-function")
(defun next-error-global ()
  (interactive)
  (select-window (get-buffer-window "*compilation*"))
  (switch-to-buffer "*compilation*")
  (execute-kbd-macro (symbol-function 'tst))
  ;;(compilation-next-error-function)
)

(global-set-key (kbd "C-c C-d") 'compile)
(global-set-key (kbd "C-c C-k") 'compile)
(global-set-key (kbd "C-c C-v") 'next-error-global)

(defun c++-styles ()
  (c-set-offset 'innamespace 0)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0))
(add-hook 'c++-mode-hook 'c++-styles)
(add-hook 'c++-mode-hook
          '(lambda ()
             (hs-minor-mode 1)
             (local-set-key (kbd "C-c S") 'hs-show-all)
             (local-set-key (kbd "C-c H") 'hs-hide-all)
             (local-set-key (kbd "C-c s") 'hs-show-block)
             (local-set-key (kbd "C-c h") 'hs-hide-block)
             (local-set-key (kbd "C-c C-f") 'hs-toggle-hiding)

             (local-set-key (kbd "RET") 'newline-and-indent)
             (local-unset-key (kbd "C-c C-d"))
             (set-fill-column 80)
;;             (global-set-key (kbd "C-c C-d") 'compile)
             ;;(local-set-key (kbd "M-;") 'semantic-ia-show-summary)
             ))

;;(semantic-mode 1)
;;(global-semantic-idle-scheduler-mode 1)
;;(global-semantic-idle-summary-mode 1)
;;(setq semantic-idle-scheduler-idle-time 1)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)
(defun new-buffer ()
  (interactive)
  (let ((x (read-from-minibuffer "Name: ")))
    (switch-to-buffer (get-buffer-create x))))
(global-set-key "\C-xnb" 'new-buffer)

(setq dired-recursive-deletes 'always)
(transient-mark-mode 0)
(global-font-lock-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(iswitchb-mode 1)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key (kbd "C-M-h") 'backward-kill-sexp)

(global-set-key "\C-c\C-@" 'pop-to-mark-command)
(global-set-key "\eg" 'goto-line)
(global-set-key "\C-o" 'other-window)
(global-set-key "\eo" 'other-frame)
(global-set-key (kbd "C-x M-%") 'query-replace-regexp)

(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(vc-follow-symlinks nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:foreground "light blue"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "brightcyan")))))

;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)
;;(set-face-attribute 'default nil :height 100)

(add-to-list 'load-path "~/.emacs.d/packages")
;;(load "c-eldoc")
(load "ascope")
(load "markdown-mode")

(load "inf-ruby")
(load "yari")
(add-hook 'ruby-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

(add-hook
 'c-mode-hook
 '(lambda ()
    (local-set-key (kbd "RET") 'newline-and-indent)
;;    (c-turn-on-eldoc-mode)
))

(global-hi-lock-mode t)
(defface hi-mlucy '((t (:foreground "#000000" :background "#ff0000"))) "1")
(defface hi-mlucy2 '((t (:foreground "#000000" :background "#00ff00"))) "2")
(defface hi-mlucy3 '((t (:foreground "#000000" :background "#0000ff"))) "3")
(defface hi-green2 '((t (:foreground "#00ff00" :background "#000000"))) "4")
(add-to-list 'hi-lock-face-defaults "hi-mlucy")
(setf hi-lock-file-patterns-policy '(lambda (x) t))

;;;;;RethinkDB
;; (tool-bar-mode -1)
;; (menu-bar-mode -1)
;; (column-number-mode 1)
;; (show-paren-mode 1)
;; (setq inhibit-startup-screen t)

;; (defun darkness ()
;;   (interactive)
;;   (set-foreground-color "white")
;;   (set-background-color "black"))
;; (defun defaultness ()
;;   (interactive)
;;   (set-foreground-color "black")
;;   (set-background-color "white"))

(setq make-backup-files nil)



(add-to-list 'auto-mode-alist '("[.]tcc$" . c++-mode))

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(fset 'real_make_term
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\C-adclass _term_t : public op_term_t {public:_term_t(env_t *env, const Term2 *term) : op_term_t(env, term, argspect_t)_ { }private:virtual val_t *eval_impl() {}RDB_NAME(\"\")}; xindent-region\C-[\C-f\C-p\C-p\C-p        " 0 "%d")) arg)))
(global-set-key (kbd "C-c C-m") 'real_make_term)

;;(ido-mode 1)

;;;;;
;; C-x C-k C-k : Execute macro
;; C-x C-k   r : Run on input region
;; C-x C-k C-p : Previous macro
;; C-x C-k C-n : Next macro

;; C-x C-k   n : Name macro
;; C-x C-k   b : Bind macro
;;;;; (insert-kbd-macro)

;;;;;
;; C-x w h : highlight
;; C-x w l : highlight lines
;; C-x w r : unhighlight

;; C-x w b : dump highlight rules
;; C-x w i : load highlight rules
;;;;;

(fset 'ruby-eval-buffer
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote (" hxruby-send-region  " 0 "%d")) arg)))
(fset 'argumentify "\C-[b<b>+\C-[f+</b>")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (hs-minor-mode 1)
             (local-set-key (kbd "C-c S") 'hs-show-all)
             (local-set-key (kbd "C-c H") 'hs-hide-all)
             (local-set-key (kbd "C-c s") 'hs-show-block)
             (local-set-key (kbd "C-c h") 'hs-hide-block)
             (local-set-key (kbd "C-c C-f") 'hs-toggle-hiding)

             (local-set-key (kbd "C-c C-j") 'argumentify)
             (local-set-key (kbd "C-c C-d") 'ruby-eval-buffer)))

(number-to-register 0 (elt "_" 0))
(fset 'insert-debugf
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("	debugf(\"%3d: %s:%d --\\n\", r+_ri_, __FILE__, __LINE__);" 0 "%d")) arg)))
(global-set-key (kbd "C-c C-j") 'insert-debugf)

(defun eshell/z (&rest args)
  (let ((arg (reduce (lambda (a b) (concat a " " b)) (cons " " args))))
    (eshell/cd (shell-command-to-string (format "fasd -de 'printf %%s' %s" arg)))))

(fset 'bt_test_macro
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\\\\>.run.to_a:(sleep-for 0.3)Query w	check(,'	','	')" 0 "%d")) arg)))

(defun grify ()
  (interactive)
  (hi-lock-mode 1)
  (hi-lock-face-buffer " locking" "hi-green")
  (hi-lock-face-buffer " unlocking" "hi-mlucy"))

(set-fill-column 80)

(setq iswitchb-buffer-ignore '("^ "))
