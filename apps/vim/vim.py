import re
from contextlib import contextmanager

from talon import Module, actions

mod = Module()

# FIXME: Copied from iterm2.py. How do we abstract this?
TITLE_RE = re.compile(r'(tmux:)?vim:(?P<mode>[A-Za-z]+):(?P<filename>.*)')


MODE_TRANSITIONS = {
    ('n', 'i'): 'i',
    ('i', 'n'): 'escape',
}


def get_transition(from_mode, to_mode):
    return MODE_TRANSITIONS.get((from_mode, to_mode))


def get_transitions(from_mode, to_mode):
    return (
        get_transition(from_mode, to_mode),
        get_transition(to_mode, from_mode),
    )


@contextmanager
def edit_mode(target_mode):
    current_mode = actions.user.vim_edit_mode()
    if current_mode == target_mode:
        yield
    else:
        to_target, from_target = get_transitions(current_mode, target_mode)
        if to_target and from_target:
            actions.key(to_target)
            try:
                yield
            finally:
                actions.key(from_target)


@mod.action_class
class vim_actions:
    def vim_edit_mode():
        """Get the current vim edit mode"""
        title = actions.win.title()
        match = TITLE_RE.search(title)
        if match:
            mode = match.group('mode')
            return mode

    def vim_window_switch(arrow_key: str):
        """Move window focus"""
        with edit_mode('n'):
            actions.key("ctrl-w")
            actions.key(arrow_key)
