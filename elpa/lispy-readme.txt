Due to the structure of Lisp syntax it's very rare for the
programmer to want to insert characters right before "(" or right
after ")".  Thus unprefixed printable characters can be used to call
commands when the point is at one of these locations, which are
further referred to as special.

Conveniently, when located at special position it's very clear to
which sexp the list-manipulating command will be applied to, what
the result be and where the point should end up afterwards.  You
can enhance this effect with `show-paren-mode' or similar.

Here's an illustration to this effect, with `lispy-clone' ("*"
represents the point):
|--------------------+-----+--------------------|
| before             | key | after              |
|--------------------+-----+--------------------|
|  (looking-at "(")* |  c  |  (looking-at "(")  |
|                    |     |  (looking-at "(")* |
|--------------------+-----+--------------------|
| *(looking-at "(")  |  c  | *(looking-at "(")  |
|                    |     |  (looking-at "(")  |
|--------------------+-----+--------------------|

When special, the digit keys call `digit-argument', since most
`lispy' commands accept a numeric argument.  For instance, "3c" is
equivalent to "ccc" (clone sexp 3 times), and "4j" is equivalent to
"jjjj" (move point 4 sexps down).  Some useful applications are
"9l" and "9h" - they exit list forwards and backwards respectively
at most 9 times which makes them effectively equivalent to
`end-of-defun' and `beginning-of-defun'.

To move the point into a special position, use:
"]" - calls `lispy-forward'
"[" - calls `lispy-backward'
"C-3" - calls `lispy-right' (exit current list forwards)
")" - calls `lispy-right-nostring' (exit current list
      forwards, but self-insert in strings and comments)

These are the few Lispy commands that don't care whether the point
is special or not.  Other such bindings are `DEL', `C-d', `C-k'.

To get out of the special position, you can use any of the good-old
navigational commands such as `C-f' or `C-n'.
Additionally `SPC' will break out of special to get around the
situation when you have the point between open parens like this
"(|(" and want to start inserting.  `SPC' will change the code to
this: "(| (".

A lot of Lispy commands come in pairs: one reverses the other.
Some examples are:
|-----+--------------------------+------------+-------------------|
| key | command                  | key        | command           |
|-----+--------------------------+------------+-------------------|
| j   | `lispy-down'             | k          | `lispy-up'        |
| s   | `lispy-move-down'        | w          | `lispy-move-up'   |
| >   | `lispy-slurp'            | <          | `lispy-barf'      |
| c   | `lispy-clone'            | C-d or DEL |                   |
| C   | `lispy-convolute'        | C          | reverses itself   |
| d   | `lispy-different'        | d          | reverses itself   |
| M-j | `lispy-split'            | +          | `lispy-join'      |
| O   | `lispy-oneline'          | M          | `lispy-multiline' |
| S   | `lispy-stringify'        | C-u "      | `lispy-quotes'    |
| ;   | `lispy-comment'          | C-u ;      | `lispy-comment'   |
| xi  | `lispy-to-ifs'           | xc         | `lispy-to-cond'   |
| F   | `lispy-follow'           | D          | `pop-tag-mark'    |
|-----+--------------------------+------------+-------------------|

Here's a list of commands for inserting pairs:
|-----+------------------------------------|
| key | command                            |
|-----+------------------------------------|
|  (  | `lispy-parens'                     |
|  {  | `lispy-braces'                     |
|  }  | `lispy-brackets'                   |
|  "  | `lispy-quotes'                     |
|-----+------------------------------------|

Here's a list of modified insertion commands that handle whitespace
in addition to self-inserting:
|-----+------------------------------------|
| key | command                            |
|-----+------------------------------------|
| SPC | `lispy-space'                      |
|  :  | `lispy-colon'                      |
|  ^  | `lispy-hat'                        |
|  '  | `lispy-tick'                       |
|  `  | `lispy-backtick'                   |
| C-m | `lispy-newline-and-indent'         |
|-----+------------------------------------|

You can see the full list of bound commands with "F1 f lispy-mode".

Most special commands will leave the point special after they're
done.  This allows to chain them as well as apply them continuously
by holding the key.  Some useful holdable keys are "jkf<>cws;".
Not so useful, but fun is "/": start it from "|(" position and hold
until all your Lisp code is turned into Python :).

Some Clojure support depends on `cider'.
Some Scheme support depends on `geiser'.
Some Common Lisp support depends on `slime' or `sly'.
You can get them from MELPA.

See http://abo-abo.github.io/lispy/ for a detailed documentation.
