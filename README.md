# enzu.ru .emacs.d

![exwm on Slackware](images/exwm.png "My .emacs.d running exwm on Slackware with the enzuru-deep-thought.el theme file loaded")

This handcrafted repo contains my Emacs Lisp code tying together a selection of more than one hundred of the finest packages ever written for Emacs, all working in harmony with one another.

When I was starting off with GNU Emacs, other people's customizations were deeply helpful for me as a starting point; some of those customizations still find a home in my Emacs instance today. In the spirit of free software, I hope that I can pass on the good will.

## Instructions

This repository includes submodules, so you will want to pull the code like this:

```
git clone --recurse-submodules -j8 https://github.com/enzuru/.emacs.d.git
```

If you ever need to remove compiled Lisp files, the bin directory contains a handy script:

```
./bin/remove-elc-files
```

Everything is very organized in the `enzuru` folder by feature, mode, preference, setup, operating system, and theme. While this repo should work immediately for you on a `git pull`, it's obviously a very personalized setup and many things won't appeal to you. If I were you, I would first take a look at my `init.el` and then pick a topical elisp file from there.

Happy hacking!

# License

Licensed under the GPLv3; copyright is assigned to my eponymous nonprofit [enzu.ru](https://enzu.ru)
