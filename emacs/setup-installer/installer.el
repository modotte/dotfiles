(setq lexical-binding t)

(message "")
(message "Launching..")
(message "")
(defconst emacs-root "~/.emacs")
(message "EMACS INIT ROOT: %s" emacs-root)
(message "")

(find-file "./setup.txt")
(write-file emacs-root)
(kill-buffer)

(message "")
(message "Loading melpa list..")
(message "")
(load-file emacs-root)

(message "")
(message "Refreshing package lists from (M)ELPA..")
(message "")
(package-refresh-contents)

(message "")
(message "Installing defined packages..")
(message "")

;;; Recommended for Emacs 26+.
;;; Some might not work with less than that version.
;; (M)ELPA package list
;; install packages from here
(setq package-list
      '(smex ; more automatic M-X auto-complete
        nyan-mode ; who doesn't love nyan cat for file position indicator
        neotree ; simple and working project tree view
        python-mode ; why not?
        slime ; common lisp REPL on steroid
        slime-company ; cool autocomplete for SLIME
        aggressive-indent ; make indentation automatic, forcefully
        company ; is here if I want to use for alternative auto-complete
        vlf ; for opening extremely huge file without failing
        helm-swoop ; simple project-wide search-and-replace
        magit ; useful interactivity with git
        monokai-theme ; good ol rad theme
        material-theme ; new ish theme
        auto-complete ; cool autocomplete
        web-mode ; awesome HTML5 mode
        meson-mode ; meson build system
        clang-format ; C/C++ auto-formatting (recommends webkit style)
        lua-mode ; for Lua lang syntax highlighting
))

(dolist (i package-list)
  (message "")
  (message "Installing %s" i)
  (package-install i))

(find-file "./setup2.txt")
(write-file emacs-root)
(kill-buffer)

(message "")
(message "done")
(message "")

