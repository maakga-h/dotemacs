
;; Consts to check operating system
(defconst *is-mac* (eq system-type 'darwin)
  "Const for system check, macOS.")

(defconst *is-linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux))
  "Const for system check, GNU/Linux.")

(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
  "Const for system check, Windows or DOS.")

(defconst *is-unix* (or *is-linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )

(defconst *is-cygwin* (eq system-type 'cygwin) )

(provide 'init-consts)
