# enzu.ru .emacs.d

![exwm on Slackware](images/exwm.png "My .emacs.d running exwm on Slackware with the enzuru-deep-thought.el theme file loaded")

This handcrafted repo contains my Emacs Lisp code tying together a selection of more than 100 of the finest packages ever written for Emacs, all working in harmony with one another.

For ease of use and analysis, I have bucked good practice and checked in the external packages in the `elpa` and `local` directories.

When I was starting off with GNU Emacs, other people's customizations were deeply helpful for me as a starting point; some of those customizations still find a home in my Emacs instance today. In the spirit of free software, I hope that I can pass on the good will.

This repository includes submodules, so you will want to pull the code like this:

```
git clone --recurse-submodules -j8 https://github.com/enzuru/.emacs.d.git
```

If you ever need to remove compiled Lisp files, the root directory contains a handy script:

```
./remove-compiled-files
```

Everything is very organized in the `enzuru` folder by feature, mode, preference, setup, operating system, and theme. While this repo should work immediately for you on a `git pull`, it's obviously a very personalized setup and many things won't appeal to you. If I were you, I would first take a look at my `init.el` and `enzuru/setup/enzuru-keys.el` and then pick a topical elisp file from there.

Happy hacking!
