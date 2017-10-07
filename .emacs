;; Package
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)


;; Unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
; This from a japanese individual.  I hope it works.
(setq-default default-buffer-file-coding-system 'utf-8)
; From Emacs wiki
(setq-default x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))


;; Global
(column-number-mode 1)
(desktop-save-mode 1)
(display-battery-mode 0)
(display-time-mode 0)
(gpm-mouse-mode 0)
(menu-bar-mode 0)
(savehist-mode 1)

;; Modules
(require 'whitespace)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require `linum)
(global-linum-mode 1)

(require 'ido)
(ido-mode t)


;; Desktop
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)


;; Shortcuts
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x f") 'find-file-in-repository)


;; file modes
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))


;; Mode hooks
(add-hook 'ruby-mode-hook
          (lambda()
            (define-key ruby-mode-map "{" nil)
            (define-key ruby-mode-map "}" nil)))

(add-hook 'c-mode-hook
  (lambda()
    (if buffer-file-name
      (cond
        ((string-match "/mpv/" buffer-file-name) (setq c-basic-offset 4))
        (t (c-set-style "Linux"))))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(desktop-path (quote ("~/.emacs.d/")))
 '(desktop-restore-eager 10)
 '(font-lock-maximum-decoration 3)
 '(graphviz-dot-auto-indent-on-braces nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.linux_64\\.d$" "\\.tsk$" "\\.o$" "\\.gcda$" "\\.gcno$")))
 '(indent-tabs-mode nil)
 '(jit-lock-defer-time 0.1)
 '(js-indent-level 2)
 '(linum-format "%3d ")
 '(make-backup-files nil)
 '(mumamo-chunk-coloring 1000)
 '(package-selected-packages
   (quote
    (find-file-in-repository yaml-mode markdown-mode magit groovy-mode graphviz-dot-mode cmake-mode)))
 '(require-final-newline 1)
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values (quote ((encoding . binary) (encoding . utf-8))))
 '(scss-compile-at-save nil)
 '(scss-sass-command "compass compile -e production --force")
 '(whitespace-style (quote (face empty tabs lines-tail trailing))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (min-colors 8)) (:foreground "cyan" :weight bold))))
 '(font-lock-comment-face ((default nil) (nil (:foreground "red"))))
 '(font-lock-function-name-face ((((class color) (min-colors 8)) (:foreground "cyan" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#00ff00"))))
 '(magit-diff-added ((t (:background "#336633" :foreground "black"))))
 '(magit-diff-added-highlight ((t (:background "#336633" :foreground "black"))))
 '(magit-hash ((t (:foreground "green"))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 8)) (:background "blue")))))
