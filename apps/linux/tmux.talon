tag: user.tmux
-
muck: "tmux "

#session management
muck session new:
    insert('tmux new ')
muck sessions:
    key(ctrl-a)
    key(s)
muck session rename:
    key(ctrl-a)
    key($)
muck kill session:
    insert('tmux kill-session -t ')
#window management
muck win new:
    key(ctrl-a)
    key(c)
muck win <number>:
    key(ctrl-a )
    key('{number}')
muck win last:
    key(ctrl-a)
    key(p)
muck win next:
    key(ctrl-a)
    key(n)
muck win rename:
    key(ctrl-a)
    key(,)
muck win close:
    key(ctrl-a)
    key(&)
#pane management
muck split horizontal:
    key(ctrl-a)
    key(|)
muck split vertical:
    key(ctrl-a)
    key(-)
muck pane next:
    key(ctrl-a)
    key(o)
muck pane <user.arrow_key>:
    key(ctrl-a)
    key(arrow_key)
muck pane close:
    key(ctrl-a)
    key(x)
#Say a number right after this command, to switch to pane
muck pane numbers:
    key(ctrl-a)
    key(q)
muck buffer:
    key(ctrl-a)
    key([)
