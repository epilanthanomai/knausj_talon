import os
import re

from talon import Context, Module, actions, imgui, settings, ui

ctx = Context()
ctx.matches = r"""
app: iterm2
"""
directories_to_remap = {}
directories_to_exclude = {}


@ctx.action_class("user")
class user_actions:
    # def file_manager_current_path():
    #     title = ui.active_window().title

    #     if "~" in title:
    #         title = os.path.expanduser(title)

    #     if title in directories_to_remap:
    #         title = directories_to_remap[title]

    #     if title in directories_to_exclude:
    #         title = None

    #     return title

    # def file_manager_show_properties():
    #     """Shows the properties for the file"""

    # def file_manager_open_directory(path: str):
    #     """opens the directory that's already visible in the view"""
    #     actions.insert("cd ")
    #     path = '"{}"'.format(path)
    #     actions.insert(path)
    #     actions.key("enter")
    #     actions.user.file_manager_refresh_title()

    # def file_manager_select_directory(path: str):
    #     """selects the directory"""
    #     actions.insert(path)

    # def file_manager_new_folder(name: str):
    #     """Creates a new folder in a gui filemanager or inserts the command to do so for terminals"""
    #     name = '"{}"'.format(name)

    #     actions.insert("mkdir " + name)

    # def file_manager_open_file(path: str):
    #     """opens the file"""
    #     actions.insert(path)
    #     actions.key("enter")

    # def file_manager_select_file(path: str):
    #     """selects the file"""
    #     actions.insert(path)

    def terminal_list_directories():
        actions.insert("ls")
        actions.key("enter")

    def terminal_list_all_directories():
        actions.insert("ls -a")
        actions.key("enter")

    def terminal_change_directory(path: str):
        actions.insert("cd {}".format(path))
        if path:
            actions.key("enter")

    def terminal_change_directory_root():
        """Root of current drive"""
        actions.insert("cd /")
        actions.key("enter")

    def terminal_clear_screen():
        """Clear screen"""
        actions.key("ctrl-l")

    def terminal_run_last():
        actions.key("up enter")

    def terminal_kill_all():
        actions.key("ctrl-c")
        actions.insert("y")
        actions.key("enter")


# Title is heavily customized in vimrc and tmux.conf. iTerm2 also adds extra
# text e.g. "1. " at the beginning, and I'm not sure why. Hack around the
# complicated with regex :'(
TITLE_RE = re.compile(r'(tmux:)?vim:(?P<filename>.*)')

@ctx.action_class("win")
class win_actions:
    def filename():
        title = actions.win.title()
        match = TITLE_RE.search(title)
        if match:
            return match.group('filename')

    def file_ext():
        filename = actions.win.filename()
        if filename:
            return filename.split(".")[-1]
