(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq make-backup-files nil)
;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq auto-save-default nil)


(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x f") 'find-file-in-repository)

(require 'ido)
(ido-mode t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
; (setq require-final-newline 0)
(setq-default indent-tabs-mode nil)

(require `linum)
(setq linum-format "%d ")
(column-number-mode 1)
(display-battery-mode 0)
(display-time-mode 0)
(gpm-mouse-mode 0)
(global-linum-mode 1)
(menu-bar-mode 0)

(desktop-save-mode 1)
(setq desktop-restore-eager 10)
(setq desktop-path '("~/.emacs.d/"))
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

(savehist-mode 1)

(setq c-default-style "linux")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left3")
 '(font-lock-maximum-decoration 3)
 '(graphviz-dot-auto-indent-on-braces nil)
 '(graphviz-dot-auto-indent-on-semi nil)
 '(ido-ignore-files
   (quote
    ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\.linux_64\\.d$" "\\.tsk$" "\\.o$" "\\.gcda$" "\\.gcno$")))
 '(jit-lock-defer-time 0.1)
 '(js-indent-level 2)
 '(mumamo-chunk-coloring 1000)
 '(package-selected-packages
   (quote
    (find-file-in-repository yaml-mode markdown-mode magit groovy-mode graphviz-dot-mode cmake-mode)))
 '(ruby-deep-indent-paren nil)
 '(ruby-deep-indent-paren-style nil)
 '(safe-local-variable-values (quote ((encoding . binary) (encoding . utf-8))))
 '(scss-compile-at-save nil)
 '(scss-sass-command "compass compile -e production --force"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (min-colors 8)) (:foreground "cyan" :weight bold))))
 '(font-lock-comment-face ((default nil) (nil (:foreground "red"))))
 '(font-lock-function-name-face ((((class color) (min-colors 8)) (:foreground "cyan" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "brightgreen"))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 8)) (:background "blue")))))


(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook
          (lambda ()
            (define-key ruby-mode-map "{" nil)
            (define-key ruby-mode-map "}" nil)))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
