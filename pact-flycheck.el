;; pact-flycheck.el -- Pact flycheck support.

;; Copyright (c) 2017 Stuart Popejoy

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

;;; Change Log:

;;; Code:

(require 'flycheck)
(require 'pact-mode)


(flycheck-define-checker pact-checker
  "Pact smart contract language flycheck support."
  :command ("pact"
            "-r"
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

(provide 'pact-flycheck)

;;; pact-flycheck.el ends here
