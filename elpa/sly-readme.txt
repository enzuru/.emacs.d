       _____    __   __  __
      / ___/   / /   \ \/ /               |\      _,,,---,,_
      \__ \   / /     \  /                /,`.-'`'    -.  ;-;;,_
     ___/ /  / /___   / /                |,4-  ) )-,_..;\ (  `'-'
    /____/  /_____/  /_/                '---''(_/--'  `-'\_)


SLY is Sylvester the Cat's Common Lisp IDE.

SLY is a direct fork of SLIME, and contains the following
improvements over it:

* Completely redesigned REPL based on Emacs's own full-featured
  `comint.el`
* Live code annotations via a new `sly-stickers` contrib
* Consistent interactive button interface. Everything can be
  copied to the REPL.
* Multiple inspectors with independent history
* Regexp-capable M-x sly-apropos
* Contribs are first class SLY citizens and enabled by default
* Use ASDF to loads contribs on demand.

SLY tracks SLIME's bugfixes and all its familar features (debugger,
inspector, xref, etc...) are still available, but with better
integration.

See the NEWS.md file (should be sitting alongside this file) for a
complete list of features.
