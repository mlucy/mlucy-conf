(setq initial-buffer-choice "~/.emacs.d/splash.t")
(menu-bar-mode -1)
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(add-hook 'lisp-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))
(setq-default show-trailing-whitespace t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

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
             ;; (global-set-key (kbd "C-c C-d") 'compile)
             ;; (local-set-key (kbd "M-;") 'semantic-ia-show-summary)
             ))
;; 1 vicious globe mimic aunt member urban firm promote city mystery kiwi draw
;; 2 shallow shrug staff weather gate roof dynamic own fiber legend pipe spot
;; 3 trophy fresh casino crowd impulse smile game receive shift mad immune cruel
;; 4 shove critic bamboo mother main ball symbol same wolf cinnamon attend paddle
;; access minute follow damp reduce organ equip area digital ceiling dream cancel

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
(ido-mode 1)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-enable-flex-matching t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)
;; (iswitchb-mode 0)


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
 '(package-selected-packages (quote (dumb-jump projectile go-mode cider)))
 '(vc-follow-symlinks nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:foreground "light blue"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "brightcyan"))))
 '(font-lock-keyword-face ((t (:foreground "brightmagenta"))))
 '(font-lock-string-face ((t (:foreground "VioletRed3"))))
 '(markdown-italic-face ((t (:inherit font-lock-variable-name-face)))))
(set-face-foreground 'minibuffer-prompt "brightcyan")

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
(defface hi-thought7 '((t (:foreground "#87AFFF" :background "#000000"))) "1")
(defface hi-being '((t (:foreground "#FF0000" :background "#000000"))) "1")
(defface hi-speech '((t (:foreground "LightSalmon" :background "#000000"))) "1")
(defface hi-action '((t (:bold t :foreground "#808080" :background "#000000"))) "1")
(defun face-nar ()
  (interactive)
  (hi-lock-face-buffer "<[^>]+>" "hi-thought7")
  (hi-lock-face-buffer "\{[^}]+\}" "hi-being")
  (hi-lock-face-buffer "\"[^\"]+\"" "hi-speech")
  (hi-lock-face-buffer "\\*[^*\n]+\\*" "hi-action"))
(defun unface-nar ()
  (interactive)
  (hi-lock-unface-buffer "<[^>]+>")
  (hi-lock-unface-buffer "\{[^}]+\}")
  (hi-lock-unface-buffer "\"[^\"]+\"")
  (hi-lock-unface-buffer "\\*[^*\n]+\\*"))
(defun face-refresh ()
  (interactive)
  (unface-nar)
  (face-nar))

(defface hi-lines2 '((t (:foreground "#ff0000" :background "#000000"))) "1")
;; (defun face-lines ()
;;   (interactive)
;;   (hi-lock-face-buffer "[a-z_.]+:[0-9]+" "hi-lines2"))
(defun face-lines ()
  (interactive)
  (hi-lock-face-buffer "[a-z_.]+\", line [0-9]+" "hi-lines2"))
(defun unface-lines ()
  (interactive)
  (hi-lock-unface-buffer "[a-z_.]+\", line [0-9]+"))
(defun lines-refresh ()
  (interactive)
  (unface-lines)
  (face-lines))
(global-set-key (kbd "M-'") 'lines-refresh)

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
(add-to-list 'auto-mode-alist '("[.]md$" . markdown-mode))

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

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

(defun eshell/z (&rest args)
  (let ((arg (reduce (lambda (a b) (concat a " " b)) (cons " " args))))
    (eshell/cd (shell-command-to-string (format "fasd -de 'printf %%s' %s" arg)))))

(defun grify ()
  (interactive)
  (hi-lock-mode 1)
  (hi-lock-face-buffer " locking" "hi-green")
  (hi-lock-face-buffer " unlocking" "hi-mlucy"))

(set-fill-column 80)

(setq iswitchb-buffer-ignore '("^ "))

(require 'ansi-color)
(require 'eshell)
(defun eshell-handle-ansi-color ()
  (ansi-color-apply-on-region eshell-last-output-start
                              eshell-last-output-end))
(add-to-list 'eshell-output-filter-functions 'eshell-handle-ansi-color)
(setq c-macro-preprocessor "/usr/bin/g++ -C")
(setq c-macro-cppflags "-I/home/mlucy/rethinkdb/src -I/home/mlucy/rethinkdb/build/debug/proto --std=gnu++0x -pthread")

(setq
 display-buffer-alist
 '(((lambda (a b) t) . ((display-buffer-reuse-window
                         display-buffer-use-some-window)))))

(setq compile-command
      "bash -c 'rm ~/.distcc/lock/backoff*; make -C ~/rethinkdb/src DEBUG=1 -j128'")
(global-auto-revert-mode 1)

(require 'package)
(add-to-list
 'package-archives
 '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(package-initialize)

(setq my-packages '(projectile clojure-mode cider go-mode dumb-jump))
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(add-to-list 'exec-path "/home/mlucy/go/bin")
(defun gmhook ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "M-.") 'godef-jump-other-window)
  (setq tab-width 2)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (subword-mode))
(add-hook 'go-mode-hook 'gmhook)
(defun jshook ()
  (local-set-key (kbd "RET") 'newline-and-indent)
  (subword-mode)
  (setq js-indent-level 2))
(add-hook 'js-mode-hook 'jshook)

(setq uniquify-min-dir-content 1)

(setenv "GIT_EDITOR" "emacsclient")
(setenv "EDITOR" "emacsclient")

(global-set-key (kbd "M-.") 'dumb-jump-go)
(global-set-key (kbd "M-,") 'dumb-jump-back)
(global-set-key (kbd "M-;") 'dumb-jump-go-other-window)
(global-set-key (kbd "C-M-q") 'dumb-jump-quick-look)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(if window-system
    (progn
      (load-theme 'dracula)
      (set-background-color "black")
      (set-face-attribute 'fringe nil
                          :foreground (face-foreground 'default)
                          :background (face-background 'default))))

(eval-after-load 'outline
  '(progn
     (require 'outline-magic)
     (define-key outline-minor-mode-map (kbd "C-c C-c") 'outline-cycle)))

(setq python-shell-enable-font-lock nil)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
