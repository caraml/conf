;; emacs.el

(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(setq default-process-coding-system (cons 'utf-8-unix 'utf-8-unix))

(setq load-path
      (append
       (list
	(expand-file-name "~/.emacs.d/")
	)
       load-path))

(save-match-data
  (and (file-directory-p "~/.emacs.d")
       (let ((files (sort (directory-files "~/.emacs.d") #'string<))
	     file)
	 (while (setq file (car files))
	   (setq file (concat "~/.emacs.d" file))
	   (if (and (file-readable-p file)
		    (string-match "\.el$" file)
		    (not (file-directory-p file))
		    (not (backup-file-name-p file)))
	       (load-file file))
	   (setq files (cdr files))))))

(setq user-mail-address
      "mustang.a.go.go@gmail.com")
(setq inhibit-startup-message t)
(setq scroll-step 2)
(setq coulumn-number-mode t)
(setq-default transient-mark-mode t)
(setq-default fill-column 74) ;FIXME
(setq search-highlight t)
(setq automatic-hscrolling t)
(auto-compression-mode t)
(setq dired-recursive-copies t)
(setq dired-recursive-delete 'top)
(setq next-line-add-newlines nil)
(setq quail-japanies-use-double-n t)
(setq custom-file
      "~/.emacs.d/99custom.el")
(and (fboundp 'auto-image-file-mode)
     (auto-image-file-mode t))
(put 'narrow-to-region 'disabled nil)

(setq c-default-style "cc-mode")
(setq comment-multi-line t)
(setq-default indent-tabs-mode nil)
(setq c-tab-always-indent nil)
(setq scheme-program-name "gosh")

(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)
(show-paren-mode t)
(setq show-paren-style "parenthesis")
(and (boundp 'show-trailing-whitespace)
     (setq-default
      show-trailing-whitespace nil))

; keymap
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key (kbd "ESC M-%") 'query-replace-regexp)
(global-set-key (kbd "ESC M-:") 'eval-region)
(global-set-key (kbd "ESC M-<") 'beginning-of-buffer-other-window)
(global-set-key (kbd "C-x C-q") 'other-window)
(global-set-key (kbd "C-x C-q") 'view-mode)
(global-set-key (kbd "C-x l") 'goto-line)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key [C-tab] 'bury-buffer)
(global-set-key [delete] 'backward-delete-char)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)