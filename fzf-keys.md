This is a table of fzf keys, compiled from the fzf man page, with `ft` specific bindings included.

Most key combinations not listed here will be bindable, but not all. For example,
`ctrl-space` and `alt-space` are bindable, but not `shift-space`; similarly ctrl-backspace
(`ctrl-bs`) and
`alt-backspace` are bindable, but not `shift-backspace`. This is a limitation of terminals (shift+FOO
is not distinguishable from plain FOO in all cases). 

Some key combinations are functionally identical (for example, rebinding `tab` is the same thing as rebinding
`ctrl-i`; the terminal produces the same codes for both, so you cannot bind them to different
commands)

The `fzf` manpage gives an exhaustive list of bindable keys. Mouse clicks are also bindable,
although how useful that turns out to be depends a lot on how your terminal is configured.

| Key          | Action(s)                                                     |
|--------------|---------------------------------------------------------------|
| enter        | accept                                                        |
| double-click | accept                                                        |
| right-click  | toggle                                                        |
| ctrl-(c|g|q) | abort                                                         |
| esc          | abort                                                         |
| ctrl-b       | backward-char                                                 |
| left         | backward-char                                                 |
| ctrl-h       | backward-delete-char                                          |
| bspace       | backward-delete-char                                          |
| del          | delete-char                                                   |
| ctrl-a       | beginning-of-line                                             |
| home         | beginning-of-line                                             |
| ctrl-l       | clear-screen                                                  |
| ctrl-d       | delete-char/eof                                               |
| ctrl-(j|n)   | down                                                          |
| down         | down                                                          |
| ctrl-e       | end-of-line                                                   |
| end          | end-of-line                                                   |
| ctrl-f       | forward-char                                                  |
| right        | forward-char                                                  |
| ctrl-u       | unix-line-discard                                             |
| ctrl-w       | unix-word-rubout                                              |
| ctrl-(k|p)   | up                                                            |
| up           | up                                                            |
| ctrl-y       | yank                                                          |
|              |                                                               |
| alt-bspace   | backward-kill-word                                            |
| alt-b        | backward-word                                                 |
| alt-e        | (open e6 wiki page for selected tag)  (ft override)           |
| ctrl-left    | backward-word                                                 |
| alt-f        | forward-word                                                  |
| ctrl-right   | forward-word                                                  |
| alt-d        | kill-word                                                     |
|              |                                                               |
| pgdn         | page-down                                                     |
| pgup         | page-up                                                       |
| ctrl-i/tab   | toggle+unix-line-discard+top          (ft override)           |
| btab         | toggle+up                                                     |
|--------------|---------------------------------------------------------------|

(fzf man page lists 'shift-left' rather than 'ctrl-left' as being bound to backward-word, 
but at least in Sakura terminal emulator, `shift-left/right` produce results equivalent to `home/end` -- ie.
(beginning|end)-of-line. )




A list of commands that are not bound by default follows:

| Command           | Description                                                   |
|-------------------|---------------------------------------------------------------|
| accept-non-empty  | As for 'accept', but does nothing if there is no selection    |
| select-all        | Select all results currently shown                            |
| deselect-all      | Deselect all results currently shown                          |
| toggle-all        | Toggle the selectedness of all results currently shown        |
| toggle-in         | Equivalent to toggle+up if --reverse option is used,  otherwise equivalent to toggle+down |
| toggle-out        | Equivalent to toggle+down if --reverse option is used, otherwise equivalent to toggle+up |
| kill-line         | Erase the character the cursor is on, and all following characters. (compare unix-line-discard, which discards all characters to the left of the cursor.) |
| top               | Go to highest ranked result. By default, the highest ranked result is placed at the bottom of the screen. |
| ----------------- | ------------------------------------------------------------- |
| half-page-down,   | As for page-down/page-up, but travel half as far.             |
| half-page-up      |                                                               |
| preview-up,       | Like the normal up/down/page-up/page-down commands, but move through the preview rather than the results list. |
| preview-down,     |                                                               |
| preview-page-up,  |                                                               |
| preview-page-down |                                                               |
| ----------------- | ------------------------------------------------------------- |
| toggle-preview    | Turn the preview on or off                                    |
| toggle-preview-wrap | Toggle whether the preview content is automatically wrapped |
| toggle-sort       | Toggle whether the results list is sorted.                    |
| ----------------- | ------------------------------------------------------------- |
| next-history,     | Recall query history items                                    |
| previous-history  | (n.b. whether history has a use within ft is not clear)       |
| ignore            | No operation? Can be used to effectively unbind existing bindings |
| print-query       | Print query string (NOT selection), and exit.                 |
| replace-query     | Set the query string to the currently selected item. (not recommended with tabular data such as ft presents) |
| cancel            | Erase entire query if non-empty, otherwise exit with no selection |
| jump              | Jump to (displays single-character labels next to highest-ranking result; press the character indicated to go to that item) |
| jump-accept       | jump, then immediately accept the selection. (it's not clear how this differs from the command combo jump+accept) |
| ----------------- | ------------------------------------------------------------- |