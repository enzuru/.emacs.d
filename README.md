# enzu.ru .emacs.d

![exwm on Slackware](images/exwm.png "My .emacs.d running exwm on Slackware with the enzuru-deep-thought.el theme file loaded")

This handcrafted repo contains my Emacs Lisp code tying together a selection of around two hundred of the finest packages ever written for Emacs, all working in harmony with one another.

Around thirty languages and file formats are supported, but the three great Lisps (Common Lisp, Scheme, Clojure) are particularly well-supported, and ship with the REPL-centered IDEs [Sly](https://github.com/joaotavora/sly), [Geiser](https://www.nongnu.org/geiser/), and [Cider](https://github.com/clojure-emacs/cider) respectively.

When I was starting off with GNU Emacs, other people's customizations were deeply helpful for me as a starting point; some of those customizations still find a home in my Emacs instance today. In the spirit of free software, I hope that I can pass on the good will.

## Tips

Everything is very organized in the `enzuru` folder by feature, mode, preference, setup, operating system, and theme. While this repo should work immediately for you on a `git pull`, it's obviously a very personalized setup and many things won't appeal to you. If I were you, I would first take a look at my `init.el` and then pick a topical elisp file from there.

At the foundation of my package management strategy is [use-package](https://github.com/jwiegley/use-package) and [straight.el](https://github.com/radian-software/straight.el).

Happy hacking!

## Tested platforms

Probably works on any modern version of Emacs. But here's what I've actually tested recently:

- Emacs 28

## License

Licensed under the GPLv3; copyright is assigned to my eponymous nonprofit [enzu.ru](https://enzu.ru)
