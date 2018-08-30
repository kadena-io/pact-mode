Pact Mode for Emacs
===

This is an emacs mode for the smart contract language [Pact](http://kadena.io/pact).

Quick Installation
---

Install `pact-mode` from [MELPA](https://melpa.org) or clone this repo and add it to your `load-path` in your `.emacs` or `init.el` file, requiring `pact-mode`. Additionally, this mode has [Flycheck](https://github.com/kadena-io/flycheck-pact) linting support.

```lisp
(add-to-list 'load-path "~/[where you cloned it]/pact-mode/")
(require 'pact-mode)
(require 'flycheck-pact) ;;; assuming you want to use flycheck
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
- Linting via flycheck supported with the `flycheck-pact` packageCC
