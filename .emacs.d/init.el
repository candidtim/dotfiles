;; package repositories
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given package"
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


;; load theme
(require-package 'material-theme)
(load-theme 'material t)


;; evil
(require-package 'evil)
;; .. evil leader
(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
;; .. enable g; and g,
(require-package 'goto-chg)
;; .. finally, enable evil mode
(evil-mode 1)

;; evil ace jump
(require-package 'ace-jump-mode)
(setq ace-jump-word-mode-use-query-char nil)
(evil-leader/set-key "w" 'evil-ace-jump-word-mode) ;; ,w for Ace Jump (word)
(evil-leader/set-key "j" 'evil-ace-jump-line-mode) ;; ,j for Ace Jump (line)
(evil-leader/set-key "k" 'evil-ace-jump-line-mode) ;; ,k for Ace Jump (line)

;; C-a C-x to increase/decrease numbers like Vim
(require-package 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-z") 'evil-numbers/dec-at-pt)


;; powerline
(require-package 'powerline-evil)
(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)


;; neotree
(require-package 'neotree)
(setq neo-theme 'ascii)
(setq neo-window-position 'right) ;; open on the right side
(define-key evil-normal-state-map "\C-q" 'neotree-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)


;; fic-mode (highlight TODOs and FIXMEs)
(require-package 'fixme-mode)
(require 'fixme-mode)


;; show 120 column limit
(require-package 'fill-column-indicator)
;; TODO: it does the same for every hook...
(add-hook 'python-mode-hook (lambda ()
                              (fci-mode)
                              (set-fill-column 120)))
(add-hook 'emacs-lisp-mode-hook (lambda ()
                              (fci-mode)
                              (set-fill-column 120)))
(add-hook 'text-mode-hook (lambda ()
                            (fci-mode)
                            (set-fill-column 120)))
(add-hook 'markdown-mode-hook (lambda ()
                            (fci-mode)
                            (set-fill-column 120)))


;; configuration and behaviour
(tool-bar-mode -1) ;; hide tool bar
(menu-bar-mode -1) ;; hide menu bar
(scroll-bar-mode -1) ;; no scroll bars
(blink-cursor-mode 0) ;; non blinking cursor
(set-face-attribute 'default nil :height 110) ;; font size (height is in 1/10pt)
(global-hl-line-mode 1) ;; highligh current line
(set-cursor-color "#aaaaaa") ;; grey cursor
(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized))))) ;; start maximized
(setq show-paren-delay 0) ;; remove delay for show paren mode
(show-paren-mode 1) ;; show matching parens
;; (global-linum-mode t) ;; show line numbers
(setq make-backup-files nil) ;; do not create backup files

;; smoother scrolling
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; TODO
;; configure ; to use : in evil's normal mode
;; go through my .vimrc and see what else I use and read how to do same in emacs
;; show column limit at 120 chars
;; minor: keep search higlight
