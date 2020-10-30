os: mac
app: slack
-
tag(): user.messaging
# Workspace
workspace <number>: key("cmd-{number}")
action(user.messaging_workspace_previous): key(cmd-shift-[)
action(user.messaging_workspace_next): key(cmd-shift-])
# Channel
(slack | lack) [channel] info: key(cmd-shift-i)
action(user.messaging_open_channel_picker): key(cmd-k)
action(user.messaging_channel_previous): key(alt-up)
action(user.messaging_channel_next): key(alt-down)
action(user.messaging_unread_previous): key(alt-shift-up)
action(user.messaging_unread_next): key(alt-shift-down)
    # Navigation
# TODO: need for fn press depends on keyboard settings
[next] (section | zone): key(fn-f6)
(previous | last) (section | zone): key(shift-fn-f6)
(slack | lack) [direct] messages: key(cmd-shift-k)
(slack | lack) threads: key(cmd-shift-t)
(slack | lack) (history [next] | back | backward): key(cmd-[)
(slack | lack) forward: key(cmd-])
[next] (element | bit): key(tab)
(previous | last) (element | bit): key(shift-tab)
(slack | lack) (my stuff | activity): key(cmd-shift-m)
(slack | lack) directory: key(cmd-shift-e)
(slack | lack) (starred [items] | stars): key(cmd-shift-s)
(slack | lack) unread [messages]: key(cmd-shift-a)
(go | undo | toggle) full: key(ctrl-cmd-f)
action(user.messaging_open_search): key(cmd-f)
    # Messaging
grab left: key(shift-up)
grab right: key(shift-down)
add line: key(shift-enter)
(slack | lack) (slap | slaw | slapper): key(cmd-right shift-enter)
(slack | lack) edit this: key(e)
(slack | lack) (react | reaction): key(r)
(slack | lack) open thread: key(t)
(slack | lack) pin this: key(p)
(slack | lack) share this: key(s)
(insert command | commandify): key(cmd-shift-c)
insert code:  key(cmd-alt-shift-c)
(slack | lack) (bull | bullet | bulleted) [list]: key(cmd-shift-8)
(slack | lack) (number | numbered) [list]: key(cmd-shift-7)
(slack | lack) (quotes | quotation): key(cmd-shift->)
bold: key(cmd-b)
(italic | italicize): key(cmd-i)
(strike | strikethrough): key(cmd-shift-x)
action(user.messaging_mark_workspace_read): key(shift-esc)
action(user.messaging_mark_channel_read): key(esc)
(clear | scrap | scratch): key(cmd-a backspace)
    # Files and Snippets
action(user.messaging_upload_file): key(cmd-u)
(slack | lack) snippet: key(cmd-shift-enter)
    # Calls
([toggle] mute | unmute): key(m)
(slack | lack) ([toggle] video): key(v)
(slack | lack) invite: key(a)
    # Miscellaneous
(slack | lack) shortcuts: key(cmd-/)
set status: key(cmd-shift-y)
emote <user.text>: "{text}"
toggle left [sidebar]: key(cmd-shift-d)
toggle right [sidebar]: key(cmd-.)
