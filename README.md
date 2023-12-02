# enzu.ru .emacs.d

![exwm on Slackware](images/exwm.png "My .emacs.d running exwm on Slackware with the enzuru-deep-thought.el theme file loaded")

This `.emacs.d` represents my libre attempt to build and document an advanced Emacs configuration utilizing most (but not all) of the latest trends in the Emacs community, tailored of course to my personal taste and needs.

This means spicy choices like:

- `use-package`
- `eglot` over `lsp-mode`
- `vert&co` over `helm` and `iy`
- `straight.el` over `package.el`
- `flymake` over `flycheck` (what a comeback!)
- `lispy` over `paredit`
- `SLY` over `SLIME`
- `prism` over `rainbow-delimiters` and `rainbow-blocks`
- `chatgpt-shell` over the ChatGPT client you made last weekend

My code harmoniously integrates around 200 different packages. I provide a modular code architecture that is easy to fork, mold into your own, and rebrand. If you want your own vanilla `.emacs.d` (rather than a starter kit) but also don't want to start from scratch, this repo is for you.

When I was starting off with Emacs, other people's customizations were deeply helpful for me as a starting point; some of those customizations still find a home in my Emacs instance today. In the spirit of free software, I hope that I can pass on the good will.

You can draw inspiration from this repo, fork it for yourself, copy specific pieces of code, or even just add it as a submodule to your own Emacs directory.

## Features

### Operating systems

The following operating systems are supported:

- [FreeBSD](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-freebsd.el)
- [GNU/Linux](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-linux.el)
- [macOS](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-mac.el)
- [OpenBSD](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-openbsd.el)
- [Windows](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-windows.el)

Additionally, this entire `.emacs.d` can be setup with native compilation, all necessary development environments below, and as your window manager by visiting my [profiles](https://github.com/enzuru/profiles) repo, which can be executed on the [Guix](https://guix.gnu.org) GNU/Linux distribution.

### Development environments

This Emacs configuration reflects my [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)-centered [exploratory programming style](https://en.wikipedia.org/wiki/Exploratory_programming). Additionally, [Eglot](https://github.com/joaotavora/eglot) will automatically spin up an [LSP](https://en.wikipedia.org/wiki/Language_Server_Protocol) for a language if it finds one.

I provide an IDE and REPL for each major environment that I work in:

| Environment | IDE                                                             | REPL                                                                 |
|-------------|-----------------------------------------------------------------|----------------------------------------------------------------------|
| Clojure     | [CIDER](https://github.com/clojure-emacs/cider)                 | [CIDER](https://github.com/clojure-emacs/cider)                      |
| Common Lisp | [SLY](https://github.com/joaotavora/sly)                        | [SLY](https://github.com/joaotavora/sly)                             |
| Docker      | [docker.el](https://github.com/Silex/docker.el/tree/master)     | [TRAMP](https://www.gnu.org/software/tramp/#Inline-methods)          |
| Elixir      | [Alchemist](https://github.com/tonini/alchemist.el)             | [inf-elixir](https://github.com/J3RN/inf-elixir/)                    |
| Fish        | [fish-mode](https://github.com/wwwjfy/emacs-fish)               | [fish-completion](https://gitlab.com/ambrevar/emacs-fish-completion) |
| Go          | [go-mode](https://github.com/dominikh/go-mode.el)               | [go-playground](https://github.com/grafov/go-playground)             |
| Haskell     | [Intero](https://chrisdone.github.io/intero/)                   | [Dante](https://github.com/jyp/dante)                                |
| JavaScript  | [js2-mode](https://github.com/mooz/js2-mode)                    | [Indium](https://github.com/NicolasPetton/Indium/)                   |
| Kubernetes  | [kubernetes-el](https://github.com/kubernetes-el/kubernetes-el) | [TRAMP](https://www.gnu.org/software/tramp/#Inline-methods)          |
| PHP         | [php-mode](https://github.com/emacs-php/php-mode)               | [PsySH](https://github.com/emacs-php/psysh.el)                       |
| Python      | [Anaconda](https://github.com/pythonic-emacs/anaconda-mode)     | `run-python`                                                         |
| Ruby        | [Robe](https://github.com/dgutov/robe)                          | [inf-ruby](https://github.com/nonsequitur/inf-ruby)                  |
| Rust        | [Racer](https://github.com/racer-rust/emacs-racer)              | [rust-playground](https://github.com/grafov/rust-playground/)        |
| Scheme      | [Geiser](https://www.nongnu.org/geiser/)                        | [Geiser](https://www.nongnu.org/geiser/)                             |
| SQL         | [sql-mode](https://www.emacswiki.org/emacs/SqlMode)             | [emacsql](https://github.com/magit/emacsql)                          |
| TypeScript  | [Tide](https://github.com/ananthakumaran/tide)                  | [Indium](https://github.com/NicolasPetton/Indium/)                   |

One can debate about how many of the above languages Emacs is ideal for, but Emacs is certainly a best-in-class environment for Haskell, Elixir, Common Lisp, Scheme, and Clojure.

The following major languages are not well-supported outside using an LSP server with Eglot:

- C / Objective-C / C++
- Java / Groovy / Kotlin
- Swift

### Tools

This configuration ships with a great many helpful tools:

| Feature                     | Tool                                                                                  |
|-----------------------------|---------------------------------------------------------------------------------------|
| Artificial intelligence     | [chatgpt-shell](https://github.com/xenodium/chatgpt-shell)                            |
| Benchmarker                 | [elisp-benchmarks](https://elpa.gnu.org/packages/elisp-benchmarks.html)               |
| Bug tracker                 | [debbugs](https://elpa.gnu.org/packages/debbugs.html)                                 |
| Clipboard                   | [Clipetty](https://github.com/spudlyo/clipetty)                                       |
| Completion (regular buffer) | [Company](https://company-mode.github.io)                                             |
| Completion (minibuffer)     | [vert&co](https://github.com/minad/vertico#complementary-packages)                    |
| Dashboard                   | [Dashboard](https://github.com/emacs-dashboard/emacs-dashboard)                       |
| Documentation searcher      | [devdocs](https://github.com/astoff/devdocs.el)                                       |
| File manager                | [eFar](https://github.com/suntsov/efar)                                               |
| Gemini browser              | [Elpher](https://thelambdalab.xyz/elpher/)                                            |
| HTTP browser                | [EWW](https://www.gnu.org/software/emacs/manual/html_mono/eww.html)                   |
| Hyperlinker                 | [Hyperbole](https://www.gnu.org/software/hyperbole/)                                  |
| IRC client                  | [ERC](https://www.gnu.org/software/emacs/erc.html)                                    |
| LSP client                  | [Eglot](https://github.com/joaotavora/eglot)                                          |
| Mail client                 | [Gnus](https://www.gnu.org/software/emacs/manual/html_node/gnus/Don_0027t-Panic.html) |
| Mail indexer                | [Notmuch](https://notmuchmail.org/notmuch-emacs/)                                     |
| Modal editor                | [lispy](https://github.com/abo-abo/lispy)                                             |
| Modeline                    | [Smart Mode Line](https://github.com/Malabarba/smart-mode-line)                       |
| MUD client                  | [mu.el](https://www.emacswiki.org/emacs/mu.el)                                        |
| Music player                | [Emms](https://www.gnu.org/software/emms/)                                            |
| Music streamer              | [pianobar.el](https://github.com/agrif/pianobar.el)                                   |
| Organization                | [org-mode](https://orgmode.org)                                                       |
| Project interaction         | [project.el](https://www.gnu.org/software/emacs/manual/html_node/emacs/Projects.html) |
| REST client                 | [restclient.el](https://github.com/pashky/restclient.el)                              |
| Shell                       | [Eshell](https://www.gnu.org/software/emacs/manual/html_mono/eshell.html)             |
| Spreadsheets                | [Dismal](https://elpa.gnu.org/packages/dismal.html)                                   |
| Syntax checker              | [flymake](https://www.gnu.org/software/emacs/manual/html_mono/flymake.html)           |
| Syntax highlighter          | [prism](https://github.com/alphapapa/prism.el)                                        |
| Undo visualizer             | [undo-tree](https://elpa.gnu.org/packages/undo-tree.html)                             |
| Version control             | [Magit](https://magit.vc)                                                             |
| Window manager              | [exwm](https://github.com/ch11ng/exwm)                                                |

### Themes

There are many beautiful theme families for you to enjoy:

- [arjen-grey](https://github.com/credmp/arjen-grey-theme)
- [deep-thought](https://github.com/enzuru/emacs-deep-thought-theme)
- [exotica](https://github.com/zenobht/exotica-theme)
- [gotham](https://github.com/emacsmirror/gotham-theme)
- [molokai](https://github.com/alloy-d/color-theme-molokai)
- [omtose-phellack](https://github.com/franksn/omtose-phellack-theme)
- [purple-haze](https://github.com/emacsfodder/emacs-purple-haze-theme)
- [sanityinc-tomorrow](https://github.com/purcell/color-theme-sanityinc-tomorrow)
- [zenburn](https://github.com/bbatsov/zenburn-emacs)

### Package managers

Package management is provided by:

- [use-package](https://github.com/jwiegley/use-package)
- [straight.el](https://github.com/radian-software/straight.el)

### Modularity

If you wanted to reference my `.emacs.d` from your own, you could add it as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules) to your Emacs directory, add that folder to your load path, and then reference specific files of mine that you like.

Run something like this in your Emacs directory:

```
git submodule add https://github.com/enzuru/.emacs.d enzuru
```

Add something like this to your init:

```
(add-to-list 'load-path "~/.emacs.d/enzuru/enzuru/features")
(require 'enzuru-file-management)
```

Referencing my configuration requires use-package and straight.el.

### Versions

I basically only support one version of Emacs at a time:

- Emacs 29

## Keystrokes

### Help

These are the most important keystrokes of all. If you know these keys keystrokes, you can get helpful information whenever you are stuck! These keystrokes are far more helpful than Google.

- `C-h(elp) b(indings)` shows the keybindings available in the current buffer.
- `C-h(elp) d(ocumentation)` lets you search through all available documentation.
- `C-h(elp) f(unction)` displays the current list of available functions.
- `C-h(elp) i(nfo)` shows the info docs installed on your computer (no need to have a browser open just to read documentation).
- `C-h(elp) m(ode)` shows information about all the modes in the buffer.
- `C-h(elp) k(ey)` let’s you type a keystroke and find out what it does.
- `C-h(elp) v(ariable)` displays the list of available variables.

### Basics

This is the stuff that you're used to doing in other editors.

- `C-w` is my cut, `M-w` (or `C-q(opy)`) is my copy, `C-y` is my paste.
- `C-k` deletes a line.
- `C-g` cancels the current action.

### Navigation

These keystrokes are for navigating Emacs. They are not intuitive at all, but are unfortunately necessary to memorize.

- `C-up` and `C-down` let me skip up and down paragraphs respectively.
- `C-x up` and `C-x down` let me get to the top and bottom of a buffer respectively.
- `C-a` and `C-e` get me between the front and end of a line respectively.
- `C-f` and `C-v` let me scroll up and down respectively.
- `C-s` let’s me search a buffer.
- `M-g` let’s me quickly jump to any line number.

### Buffer management

Some Vim and Emacs users share a distaste for the arrow keys for speed reasons, but I personally don’t. I don’t deny that they are a little slower.

- `C-x C-b(uffer)` helps me find a buffer.
- `C-tab` (or `C-x o(ther)`) let’s me switch to another visible buffer.
- `Shift-up`, `shift-left`, `shift-right`, and `shift-down` let me move to a buffer in that direction.
- `C-x left` and `C-x right` let me run backward and forward through the list of buffers.
- `C-x k(ill)` aggressively kills a buffer.

### Window management

- `C-x 0` deletes an Emacs window, whereas `C-x 1` deletes all other Emacs windows.
- `C-x 2` does a horizontal split, and `C-x 3` does a vertical split.
- `C-c(onfiguration) left` and `C-c(configuration) right` lets me iterate through window configurations.

### Tab management

I have keystrokes setup to emulate tmux/screen using Emacs tabs.

- `C-z(one) c(reates)` a new workspace.
- `C-z(one) k(ills)` a current workspace.
- `C-z(one) n(ext)` workspace.
- `C-z(one) p(revious)` workspace.

### Console actions

These keystrokes encompass things one commonly does in a terminal.

- `C-c(onsole) d(ocker)` brings up tools for managing and shelling into Docker containers.
- `C-c(onsole) e(shell)` let’s me boot up an Emacs shell which is an awesome hybrid between a Lisp interpreter and a traditional POSIX shell.
- `C-c(onsole) x(term)` let’s me boot up a real terminal.
- `C-c(onsole) s(tatus)` let’s me bring up a dashboard with the current git status for the git repo that I am working in.
- `C-c(onsole) C-p(ushes)` my current git branch to origin.

### Primary commands

These are the most powerful commands, mostly applications.

- `C-x c(ompile)` let’s me run a compile command on any buffer I’m working on. This can be used to run a REPL for your language too.
- `C-x f(ile)` starts a file manager.
- `C-x i(ntelligence)` starts an AI session.
- `C-x l(ocate)` locates a file on your disk.
- `C-x s(tring replace)` let’s me replace all strings in a buffer or selection.
- `C-x u(ndo)` will launch an undo-tree visualizer

### Secondary commands

These are less powerful commands, mostly functions.

- `C-x C-c(onsult)` let’s me search for a word at point in a project.
- `C-x C-d(ocumentation)` let’s me search online documentation.
- `C-x C-f(ile)` finds a file.
- `C-x C-m(eta)` let’s me run an Emacs function.
- `C-x C-n(ames of tabs)` let's me select a tab's name from a list.
- `C-x C-s(aves)` a buffer for me.
- `C-x C-w(here)` let’s me find where a function is defined in a language agnostic basis.

### Lisp

These bindings cover the most important things you'll do while hacking Lisp code in either Elisp, SLY, Geiser, or CIDER:

- `C-x(ecute) c(ompile)` evaluates a buffer.
- `C-x(ecute) r(egion)` evaluates a region.
- `C-x(ecute) C-d(ocumentation)` views documentation for the symbol at point.
- `C-x(ecute) C-w(here)` jumps to da efinition for the symbol at point.
- `C-h(elp) s(ymbol)` displays the available symbols in whatever Lisp environment you are in.

#### Parenthesis

When you are on parenthesis, modal editing is activated via Lispy. You can use single keystrokes to navigate, edit, and evaluate code:

- `e` evaluate s-expression
- `f` forward point through parens
- `]` move point down
- `[` move point up
- `>` slurp up next s-expression
- `<` barf up s-expression
- `w` move s-expression up
- `s` move s-expression down
- `r` raise s-expression
- `C-1` view documentation
- `C-2` view caller arguments

I redefine C-x C-c because advanced Emacs users almost never exit Emacs and therefore don’t need a hotkey when `save-buffers-exit-emacs` will do.

## Learning

Everything is very organized in the `enzuru` folder by feature, mode, preference, setup, operating system, and theme. While this repo should work immediately for you on a `git pull`, it's obviously a very personalized setup and many things won't appeal to you. If I were you, I would first take a look at my `init.el` and then pick a topical elisp file from there.

Happy hacking!

## License

Licensed under the GPLv3; copyright is assigned to my eponymous charity [enzu.ru](https://enzu.ru)
