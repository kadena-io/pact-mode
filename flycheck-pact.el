;; flycheck=pact.el -- Pact flycheck support.

;; Copyright (c) 2017 Stuart Popejoy

;; Author: Stuart Popejoy
;; Maintainer: stuart@kadena.io
;; Keywords: pact, lisp, languages, blockchain, smartcontracts
;; Url: http://github.com/kadena-io/pact-mode

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A major mode for editing Pact, a smart contract language, in Emacs.
;; See `http://kadena.io/pact'.

;;; Change Log:

;;; Code:

(require 'flycheck)
(require 'pact-mode)


(flycheck-def-option-var flycheck-pact-do-trace nil pact-checker
  "Controls whether pact linting should include trace output.

Use `flycheck-pact-toggle-trace` to enable and disable interactively.
Requires at least pact 2.3.4."
  :type 'boolean
  :safe #'booleanp)


(flycheck-define-checker pact-checker
  "Pact smart contract language flycheck support."
  :command ("pact"
            "-r"
            (option-flag "-t" flycheck-pact-do-trace)
            source-inplace)
  :error-patterns
  ((warning line-start
            (file-name (minimal-match
                        (and (not blank)
                             (one-or-more not-newline))))
            ":" line ":" column
            ":Warning:"
            (message)
            line-end)
   (info line-start
            (file-name (minimal-match
                        (and (not blank)
                             (one-or-more not-newline))))
            ":" line ":" column
            ":Trace:"
            (message)
            line-end)
   (error line-start
          (file-name (minimal-match
                        (and (not blank)
                             (one-or-more not-newline))))
          ":" line ":" column
          ":"
          (message)
          line-end))
  :modes (pact-mode)
  :error-filter
  (lambda (errors)
    ;;(dolist (err errors)
    ;;  (message "huh %s" err))
    (flycheck-increment-error-columns errors))
  )

(customize-set-variable 'flycheck-checkers (add-to-list 'flycheck-checkers 'pact-checker))

(defun flycheck-pact-toggle-trace ()
  "Toggle pact linting of trace output."
  (interactive)
  (set (make-local-variable 'flycheck-pact-do-trace) (not flycheck-pact-do-trace))
  (message "Pact tracing %s" (if flycheck-pact-do-trace "enabled" "disabled")))

(provide 'flycheck-pact)

;;; flycheck-pact.el ends here
