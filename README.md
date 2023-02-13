# enzu.ru .emacs.d

![exwm on Slackware](images/exwm.png "My .emacs.d running exwm on Slackware with the enzuru-deep-thought.el theme file loaded")

This handcrafted repo contains my Lisp code harmoniously integrating a selection of around two hundred of the finest packages for Emacs.

When I was starting off with Emacs, other people's customizations were deeply helpful for me as a starting point; some of those customizations still find a home in my Emacs instance today. In the spirit of free software, I hope that I can pass on the good will.

## Features

### Operating systems

The following operating systems are supported:

- [FreeBSD](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-freebsd.el)
- [GNU/Linux](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-linux.el)
- [macOS](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-mac.el)
- [OpenBSD](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-openbsd.el)
- [Windows](https://github.com/enzuru/.emacs.d/blob/master/enzuru/operating-systems/enzuru-windows.el)

### Programming languages

This Emacs configuration reflects my REPL-centered [exploratory programming style](https://en.wikipedia.org/wiki/Exploratory_programming). Additionally, [Eglot](https://github.com/joaotavora/eglot) will automatically spin up an [LSP](https://en.wikipedia.org/wiki/Language_Server_Protocol) for a language if it finds one.

I provide an IDE and REPL for each major environment that I work in:

| Language    | IDE                                                             | REPL                                                                 |
|-------------|-----------------------------------------------------------------|----------------------------------------------------------------------|
| Clojure     | [CIDER](https://github.com/clojure-emacs/cider)                 | [CIDER](https://github.com/clojure-emacs/cider)                      |
| Common Lisp | [Sly](https://github.com/joaotavora/sly)                        | [Sly](https://github.com/joaotavora/sly)                             |
| Docker      | [docker.el](https://github.com/Silex/docker.el/tree/master)     | [docker-tramp](https://github.com/emacs-pe/docker-tramp.el)          |
| Fish        | [fish-mode](https://github.com/wwwjfy/emacs-fish)               | [fish-completion](https://gitlab.com/ambrevar/emacs-fish-completion) |
| Go          | [go-mode](https://github.com/dominikh/go-mode.el)               | [go-playground](https://github.com/grafov/go-playground)             |
| Haskell     | [Intero](https://chrisdone.github.io/intero/)                   | [Dante](https://github.com/jyp/dante)                                |
| JavaScript  | [js2-mode](https://github.com/mooz/js2-mode)                    | [Indium](https://github.com/NicolasPetton/Indium/)                   |
| Kubernetes  | [kubernetes-el](https://github.com/kubernetes-el/kubernetes-el) | [kubernetes-tramp](https://github.com/gruggiero/kubernetes-tramp)    |
| PHP         | [php-mode](https://github.com/emacs-php/php-mode)               | [psysh](https://github.com/emacs-php/psysh.el)                       |
| Python      | [Anaconda](https://github.com/pythonic-emacs/anaconda-mode)     | [Elpy](https://github.com/jorgenschaefer/elpy)                       |
| Ruby        | [Robe](https://github.com/dgutov/robe)                          | [inf-ruby](https://github.com/nonsequitur/inf-ruby)                  |
| Rust        | [Racer](https://github.com/racer-rust/emacs-racer)              | [rust-playground](https://github.com/grafov/rust-playground/)        |
| Scheme      | [Geiser](https://www.nongnu.org/geiser/)                        | [Geiser](https://www.nongnu.org/geiser/)                             |
| SQL         | [sql-mode](https://www.emacswiki.org/emacs/SqlMode)             | [emacsql](https://github.com/magit/emacsql)                          |
| TypeScript  | [Tide](https://github.com/ananthakumaran/tide)                  | [Indium](https://github.com/NicolasPetton/Indium/)                   |

The following major languages are not well-supported outside using an LSP server with Eglot:

- C / Objective-C / C++
- Java / Groovy / Kotlin
- Swift

### Tools

This configuration ships with a great many helpful tools:

| Feature                | Tool                                                                                            |
|------------------------|-------------------------------------------------------------------------------------------------|
| Benchmarker            | [elisp-benchmarks](https://elpa.gnu.org/packages/elisp-benchmarks.html)                         |
| Bug tracker            | [debbugs](https://elpa.gnu.org/packages/debbugs.html)                                           |
| Completion             | [Company](https://company-mode.github.io), [Ivy](https://github.com/abo-abo/swiper)             |
| Dashboard              | [Dashboard](https://github.com/emacs-dashboard/emacs-dashboard)                                 |
| Documentation searcher | [devdocs](https://github.com/astoff/devdocs.el)                                                 |
| File manager           | [Sunrise Commander](https://github.com/sunrise-commander/sunrise-commander)                     |
| Hyperlinker            | [Hyperbole](https://www.gnu.org/software/hyperbole/)                                            |
| IRC client             | [ERC](https://www.gnu.org/software/emacs/erc.html)                                              |
| LSP client             | [Eglot](https://github.com/joaotavora/eglot)                                                    |
| Mail client            | [Notmuch](https://notmuchmail.org/notmuch-emacs/)                                               |
| Modal editor           | [lispy](https://github.com/abo-abo/lispy)                                                       |
| Modeline               | [Smart Mode Line](https://github.com/Malabarba/smart-mode-line)                                 |
| MUD client             | [mu.el](https://www.emacswiki.org/emacs/mu.el)                                                  |
| Music players          | [Emms](https://www.gnu.org/software/emms/), [pianobar.el](https://github.com/agrif/pianobar.el) |
| Organization           | [org-mode](https://orgmode.org)                                                                 |
| Project interaction    | [Projectile](https://github.com/bbatsov/projectile)                                             |
| REST client            | [restclient.el](https://github.com/pashky/restclient.el)                                        |
| Shell                  | [Eshell](https://www.gnu.org/software/emacs/manual/html_mono/eshell.html)                       |
| Spreadsheets           | [Dismal](https://elpa.gnu.org/packages/dismal.html)                                             |
| Syntax checker         | [flymake](https://www.gnu.org/software/emacs/manual/html_mono/flymake.html)                     |
| Syntax highlighter     | [rainbow-blocks](https://github.com/istib/rainbow-blocks)                                       |
| Undo visualizer        | [undo-tree](https://elpa.gnu.org/packages/undo-tree.html)                                       |
| Version control        | [Magit](https://magit.vc)                                                                       |
| Web browser            | [Elpher](https://thelambdalab.xyz/elpher/)                                                      |
| Window manager         | [exwm](https://github.com/ch11ng/exwm)                                                          |

### Themes

There are many beautiful theme families for you to enjoy:

- [arjen-grey-theme](https://github.com/credmp/arjen-grey-theme)
- [deep-thought](https://github.com/emacsfodder/emacs-deep-thought-theme)
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

If you wanted to use my `.emacs.d` as a foundation for your own, you could add it as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules), add it to your load path, and then reference specific modules of mine that you like.

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

Probably works on any modern version of Emacs. Here's what I've actually tested recently:

- Emacs 28

## Learning

You can discover and learn anything about this Emacs setup by only using the commands below:

| Keystroke | Function                    | Description                  |
|-----------|-----------------------------|------------------------------|
| `C-h b`   | `counsel-descbinds`         | Describe a key binding       |
| `C-h d`   | `apropos-documentation`     | Search through documentation |
| `C-h f`   | `counsel-describe-function` | Describe a function          |
| `C-h i`   | `info`                      | Open documentation           |
| `C-h k`   | `describe-key`              | Describe a keystroke         |
| `C-h v`   | `counsel-describe-variable` | Describe a variable          |

Additionally, everything is very organized in the `enzuru` folder by feature, mode, preference, setup, operating system, and theme. While this repo should work immediately for you on a `git pull`, it's obviously a very personalized setup and many things won't appeal to you. If I were you, I would first take a look at my `init.el` and then pick a topical elisp file from there.

Happy hacking!

## License

Licensed under the GPLv3; copyright is assigned to my eponymous nonprofit [enzu.ru](https://enzu.ru)
