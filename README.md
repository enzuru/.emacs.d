# enzu.ru .emacs.d

![exwm on Slackware](images/exwm.png "My .emacs.d running exwm on Slackware with the enzuru-deep-thought.el theme file loaded")

This `.emacs.d` represents my libre attempt to build and document an advanced Emacs configuration utilizing most (but not all) of the latest trends in the Emacs community, tailored of course to my personal taste and needs. My code harmoniously integrates around 200 different packages.

This means spicy choices like:

- `eglot` over `lsp-mode`
- `vert&co` over `helm` and `ivy`
- `corfu` over `company`
- `straight.el` over `package.el`
- `flymake` over `flycheck` (what a comeback!)
- `meow` over `evil`
- `lispy` over `paredit`
- `sly` over `slime`
- `prism` over `rainbow-delimiters` and `rainbow-blocks`
- `gptel` over the dozens of other LLM clients

When I was starting off with Emacs, other people's customizations were deeply helpful for me as a starting point; some of those customizations still find a home in my Emacs instance today. In the spirit of free software, I hope that I can pass on the good will.

## Requirements

This config makes extensive use of language servers and tree-sitter grammars. Most of my best supported languages will try to load a language server or tree-sitter grammar. If it fails to, it will warn you and give you a chance to install what is missing.

I usually only support one version of Emacs at a time. Currently I am supporting:

- Emacs 29
- Emacs 30

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

This Emacs configuration reflects my [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop)-centered [exploratory programming style](https://en.wikipedia.org/wiki/Exploratory_programming).

I provide an IDE and REPL for each major environment that I work in.

One can debate about how many of the above languages Emacs is ideal for, but Emacs is certainly a best-in-class environment for Haskell, Elixir, Common Lisp, Scheme, and Clojure.

#### First class

The best supported developer environments are the Lisp languages. Since they have feature rich IDEs with powerful REPLs, they do not need Eglot, and arguably Lisp with its ascetic syntax benefits less from tree-sitter:

| Language    | IDE                                             | REPL                                            | Eglot | Tree-sitter |
|-------------|-------------------------------------------------|-------------------------------------------------|-------|-------------|
| Clojure     | [CIDER](https://github.com/clojure-emacs/cider) | [CIDER](https://github.com/clojure-emacs/cider) | N/A   | Yes         |
| Common Lisp | [SLY](https://github.com/joaotavora/sly)        | [SLY](https://github.com/joaotavora/sly)        | N/A   | No          |
| Scheme      | [Geiser](https://www.nongnu.org/geiser/)        | [Geiser](https://www.nongnu.org/geiser/)        | N/A   | No          |

#### Second class

I support both Eglot and tree-sitter for the following languages:

| Language | IDE                                                         | REPL                                                          | Eglot | Tree-sitter |
|----------|-------------------------------------------------------------|---------------------------------------------------------------|-------|-------------|
| C        | `c-ts-mode`                                                 |                                                               | Yes   | Yes         |
| C++      | `c++-ts-mode`                                               |                                                               | Yes   | Yes         |
| Go       | `go-ts-mode`                                                | [go-playground](https://github.com/grafov/go-playground)      | Yes   | Yes         |
| Python   | [Anaconda](https://github.com/pythonic-emacs/anaconda-mode) | `run-python`                                                  | Yes   | Yes         |
| Ruby     | [Robe](https://github.com/dgutov/robe)                      | [inf-ruby](https://github.com/nonsequitur/inf-ruby)           | Yes   | Yes         |
| Rust     | [Racer](https://github.com/racer-rust/emacs-racer)          | [rust-playground](https://github.com/grafov/rust-playground/) | Yes   | Yes         |

#### Third class

I do not support Eglot or tree-sitter for these languages. Generally it is because GNU Guix does not have an appropriate language server or tree-sitter grammar packaged for it yet:

| Language    | IDE                                                                          | REPL                                                                     | Eglot | Tree-sitter |
|-------------|------------------------------------------------------------------------------|--------------------------------------------------------------------------|-------|-------------|
| Dockerfile  | [docker.el](https://github.com/Silex/docker.el/tree/master)                  | [TRAMP](https://www.gnu.org/software/tramp/#Inline-methods)              | No    | Yes         |
| Elixir      | [Alchemist](https://github.com/tonini/alchemist.el)                          | [inf-elixir](https://github.com/J3RN/inf-elixir/)                        | No    | Yes         |
| Fish        | [fish-mode](https://github.com/wwwjfy/emacs-fish)                            | [fish-completion](https://github.com/lemonbreezes/emacs-fish-completion) | No    | No          |
| GDScript    | [gdscript-mode](https://github.com/godotengine/emacs-gdscript-mode/)         |                                                                          | Yes   | No          |
| Groovy      | [groovy-mode](https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes/)     |                                                                          | No    | No          |
| Haskell     | [Intero](https://chrisdone.github.io/intero/)                                | [Dante](https://github.com/jyp/dante)                                    | No    | No          |
| Java        | `java-ts-mode`                                                               |                                                                          | No    | Yes         |
| JavaScript  | [js2-mode](https://github.com/mooz/js2-mode)                                 | [Indium](https://github.com/NicolasPetton/Indium/)                       | No    | No          |
| Kotlin      | [kotlin-mode](https://github.com/Emacs-Kotlin-Mode-Maintainers/kotlin-mode/) |                                                                          | No    | No          |
| Objective-C | `objc-mode`                                                                  |                                                                          | No    | No          |
| PHP         | [php-mode](https://github.com/emacs-php/php-mode)                            | [PsySH](https://github.com/emacs-php/psysh.el)                           | No    | No          |
| SQL         | [sql-mode](https://www.emacswiki.org/emacs/SqlMode)                          | [emacsql](https://github.com/magit/emacsql)                              | No    | No          |
| Swift       | [swift-mode](https://github.com/swift-emacs/swift-mode/)                     |                                                                          | No    | No          |
| TypeScript  | [Tide](https://github.com/ananthakumaran/tide)                               | [Indium](https://github.com/NicolasPetton/Indium/)                       | No    | Yes         |

### Tools

This configuration ships with a great many helpful tools:

| Feature                     | Tool                                                                                             |
|-----------------------------|--------------------------------------------------------------------------------------------------|
| Benchmarker                 | [elisp-benchmarks](https://elpa.gnu.org/packages/elisp-benchmarks.html)                          |
| Bug tracker                 | [debbugs](https://elpa.gnu.org/packages/debbugs.html)                                            |
| Clipboard                   | [Clipetty](https://github.com/spudlyo/clipetty)                                                  |
| Completion (regular buffer) | [Corfu](https://github.com/minad/corfu)                                                          |
| Completion (minibuffer)     | [Vert&co](https://github.com/minad/vertico#complementary-packages)                               |
| Dashboard                   | [Dashboard](https://github.com/emacs-dashboard/emacs-dashboard)                                  |
| Documentation searcher      | [devdocs](https://github.com/astoff/devdocs.el)                                                  |
| Gemini browser              | [Elpher](https://thelambdalab.xyz/elpher/)                                                       |
| HTTP browser                | [EWW](https://www.gnu.org/software/emacs/manual/html_mono/eww.html)                              |
| Hyperlinker                 | [Hyperbole](https://www.gnu.org/software/hyperbole/)                                             |
| IRC client                  | [ERC](https://www.gnu.org/software/emacs/erc.html)                                               |
| Kubernetes client           | [kubernetes-el](https://github.com/kubernetes-el/kubernetes-el)                                  |
| LLM client                  | [gptel](https://github.com/karthink/gptel)                                                       |
| LSP client                  | [Eglot](https://github.com/joaotavora/eglot)                                                     |
| Mail client                 | [Gnus](https://www.gnu.org/software/emacs/manual/html_node/gnus/Don_0027t-Panic.html)            |
| Mail indexer                | [Notmuch](https://notmuchmail.org/notmuch-emacs/)                                                |
| Modal editor                | [Meow](https://github.com/meow-edit/meow), [Lispy](https://github.com/abo-abo/lispy)             |
| Modeline                    | [Smart Mode Line](https://github.com/Malabarba/smart-mode-line)                                  |
| MUD client                  | [mu.el](https://www.emacswiki.org/emacs/mu.el)                                                   |
| Music player                | [Emms](https://www.gnu.org/software/emms/)                                                       |
| Music streamer              | [pianobar.el](https://github.com/agrif/pianobar.el)                                              |
| Organization                | [org-mode](https://orgmode.org)                                                                  |
| Project interaction         | [project.el](https://www.gnu.org/software/emacs/manual/html_node/emacs/Projects.html)            |
| REST client                 | [restclient.el](https://github.com/pashky/restclient.el)                                         |
| Shell                       | [Eshell](https://www.gnu.org/software/emacs/manual/html_mono/eshell.html)                        |
| Spreadsheets                | [Dismal](https://elpa.gnu.org/packages/dismal.html)                                              |
| Syntax checker              | [flymake](https://www.gnu.org/software/emacs/manual/html_mono/flymake.html)                      |
| Syntax highlighter          | [prism](https://github.com/alphapapa/prism.el)                                                   |
| Terminal                    | [Eat](https://codeberg.org/akib/emacs-eat/)                                                      |
| Undo visualizer             | [undo-tree](https://elpa.gnu.org/packages/undo-tree.html)                                        |
| Version control             | [Magit](https://magit.vc)                                                                        |
| Wikipedia editor            | [mediawiki.el](https://github.com/hexmode/mediawiki-el)                                          |
| Window configuration        | [winner-mode](https://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Convenience.html) |
| Window handling             | [windmove](https://www.gnu.org/software/emacs/manual/html_node/emacs/Window-Convenience.html)    |
| Window manager              | [exwm](https://github.com/ch11ng/exwm)                                                           |

### Themes

There are many beautiful theme families for you to enjoy:

- [arjen-grey](https://github.com/credmp/arjen-grey-theme)
- [deep-thought](https://github.com/enzuru/emacs-deep-thought-theme)
- [dracula](https://github.com/dracula/emacs)
- [exotica](https://github.com/zenobht/exotica-theme)
- [gotham](https://github.com/emacsmirror/gotham-theme)
- [molokai](https://github.com/alloy-d/color-theme-molokai)
- [omtose-phellack](https://github.com/franksn/omtose-phellack-theme)
- [purple-haze](https://github.com/emacsfodder/emacs-purple-haze-theme)
- [sanityinc-tomorrow](https://github.com/purcell/color-theme-sanityinc-tomorrow)
- [timu-caribbean](https://gitlab.com/aimebertrand/timu-caribbean-theme)
- [timu-macos](https://gitlab.com/aimebertrand/timu-macos-theme)
- [timu-rouge](https://gitlab.com/aimebertrand/timu-rouge-theme)
- [timu-spacegrey](https://gitlab.com/aimebertrand/timu-spacegrey-theme)
- [zenburn](https://github.com/bbatsov/zenburn-emacs)

### Package managers

Package management is provided by:

- [use-package](https://github.com/jwiegley/use-package)
- [straight.el](https://github.com/radian-software/straight.el)

## Keystrokes

This is a modal editing setup that uses two different modal editors: Meow and Lispy. Lispy is only for Lisp languages.

I [maintain the default Emacs keybindings](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf), so I will not document them here. Meow will help you discover keystrokes after you hit `SPC`.

### Normal editing

![Meow cheat sheet](https://user-images.githubusercontent.com/11796018/144638475-160ff071-7f66-4155-b8b6-28f3db15afd7.png "Meow cheat sheet")

Run `meow-tutor` to learn Meow.

[Meow documentation](https://github.com/meow-edit/meow/blob/master/KEYBINDING_QWERTY.org)

### Lisp editing

Lispy editing is activated only in major modes for Lisp languages when around parens in Meow's insert mode.

- `e` evaluate s-expression
- `f` forward point through parens
- `b` undo
- `]` move point down
- `[` move point up
- `>` slurp up next s-expression
- `<` barf up s-expression
- `w` move s-expression up
- `s` move s-expression down
- `r` raise s-expression
- `C-1` view documentation
- `C-2` view caller arguments

[Lispy documentation](https://oremacs.com/lispy/)

### Movement between buffers

Movement between buffers is accomplished with windmove:

- `Shift-up`
- `Shift-left`
- `Shift-right`
- `Shift-down`

### Tab management

I have keystrokes setup to emulate tmux/screen using Emacs tabs.

- `C-z(one) c(reates)` a new workspace.
- `C-z(one) k(ills)` a current workspace.
- `C-z(one) n(ext)` workspace.
- `C-z(one) p(revious)` workspace.

### Custom keystrokes

These are custom keystrokes that I have setup:

- `SPC a(g)` search git repo using ag
- `SPC c(ompile)` compiles the buffer in a language appropriate way
- `SPC d(ocumentation)` brings up documentation for symbol under cursor
- `SPC e(at)` brings up the Eat terminal
- `SPC l(locate)` locate a file
- `SPC p(ush)` pushes the current git branch
- `SPC r(eplace string)` replace all occurrences of a string after point
- `SPC s(tatus)` shows the current git status
- `SPC t(abs)` search through tabs
- `SPC y(mbol)` searches symbols if using a Lisp language

The arrow keys help you manage buffers:

- `SPC <left>` previous buffer
- `SPC <right>` next buffer
- `SPC <up>` beginning of buffer
- `SPC <bottom>` bottom of buffer

## Learning

Everything is very organized in the `enzuru` folder by feature, mode, preference, setup, operating system, and theme. While this repo should work immediately for you on a `git pull`, it's obviously a very personalized setup and many things won't appeal to you. If I were you, I would first take a look at my `init.el` and then pick a topical elisp file from there.

Happy hacking!

## License

Licensed under the GPLv3; copyright is assigned to my eponymous charity [enzu.ru](https://enzu.ru)
