# -*- coding: utf-8 -*-

from xkeysnail.transform import *

# define timeout for multipurpose_modmap
define_timeout(1)

# [Global modemap] Change modifier keys as in xmodmap
define_modmap({
    Key.CAPSLOCK: Key.LEFT_CTRL
})

define_keymap(None, {
    K("Alt-b"): with_mark(K("left")),
    K("Alt-p"): with_mark(K("up")),
    K("Alt-n"): with_mark(K("down")),
    K("Alt-h"): with_mark(K("backspace")),
    K("Alt-d"): with_mark(K("delete")),
    K("Alt-a"): with_mark(K("home")),
    K("Alt-e"): with_mark(K("end")),
    K("Alt-f"): with_mark(K("right"))
})

