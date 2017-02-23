Pact Mode for Emacs
===

This is an emacs mode for the smart contract language [Pact](http://kadena.io/pact).

Quick Installation
---

Clone this repo, add it to your `load-path` in your `.emacs` file, and require `pact-mode`:

```lisp
(add-to-list 'load-path "~/[where you cloned it]/pact-mode/")
(require 'pact-mode)
(require 'pact-flycheck) ;;; assuming you want to use flycheck
```

You'll need a working Pact installation to use the inferior shell.
[Prebuilt binaries are here](http://kadena.io/pact/downloads.html)
or you can [build from source](https://github.com/kadena-io/pact#building).

Features
---
- Syntax highlighting
- Launch the pact interpreter from the 'Lisp' menu ("inferior lisp process") or with `C-c C-z`
- Load current buffer into inferior REPL with `C-c C-l`. With prefix (`C-u C-c C-l`) prompt for file to load.
- Use `semantic` features under the Development menu, like "Navigate -> Find Tag Globally ..."
  which finds any tag in any buffer you've opened.
- Linting via flycheck.
