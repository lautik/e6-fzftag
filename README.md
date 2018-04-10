Minimal fzf-based tag selection for e621
=========================================

This package provides two scripts, `ft-updatedb` and `ft`.
`ft-updatedb` downloads a list of the most used tags from e621, for `ft`s use.

`ft` is a terminal application which uses `fzf` to provide quick interactive selection of tags,
automatically copying the final selection to the clipboard.
The tags are colorized according to type.

ft is intended to be used in conjunction with your browser or image viewer of choice.


Configuration
--------------

There is no official configuration. However, you may want to modify the following before
installation:

* TAGCOUNTTHRESHOLD in `ft-updatedb`. Default value = 100. Reducing this value will include
   less-popular tags in the database.

* The invocation of `xsel` in `ft` uses the `-b` option to select the CLIPBOARD clipboard. This
  should be generally appropriate, but you may prefer `-p` (PRIMARY) or `-s` (SECONDARY) instead.


Requirements
-------------

OS:

 * Definitely works on Linux
 * May be BSD or OSX compatible, but this hasn't been tested.
 * Most Windows terminal emulators do not have ANSI color support. I'd be interested to hear from
   anyone who manages to get `ft` working to any degree on Windows.

The following programs should be installed:

* [jq](https://github.com/stedolan/jq)
* [curl](https://curl.haxx.se/)
* [fzf](https://github.com/junegunn/fzf)
* xsel

`jq`, `xsel`, and `curl` are probably available in your package manager. `fzf` is available as a package for
Fedora; for other distros, you may need to install from git. Instructions are in the fzf link
above.

Installation
-------------

A simple install script, `install.sh`, is provided.
By default it installs to `~/.local/bin`. If you want to install systemwide, you can provide the
destination path to it.

Examples:

`sh install.sh` -> install to ~/.local/bin

`sudo sh install.sh /usr/bin` -> install to /usr/bin

If the location you are installing to is not in your PATH, you will need to add it to your PATH.
Example `.bashrc` line:

`export PATH="$PATH:$HOME/.local/bin"`


Usage
------

Before running `ft` for the first time, you *must* run `ft-updatedb` once. It may be helpful to run
`ft-updatedb` on subsequent occasions, to get any new popular tags from e621, but this is certainly
not required. If you need to force an update at any time, you can use the `-f` option: `ft-updatedb -f`

ft may be invoked simply as `ft`, with no arguments. Any additional arguments provided will be passed on to fzf.
For example, you can reduce the number of terminal lines occupied by the fzf query like this:
   `ft --height=10`
(or via the `FZF_DEFAULT_OPTS` environment variable, which is documented by the fzf man page.)


There is nothing much to know about using ft: you interact with `fzf` in order to select the tags
you want, and then they are automatically copied to the clipboard. In order to use ft more
efficiently, just learn more about how to use *fzf*.

A quickstart guide to fzf, which should be augmented by viewing the fzf man page, particularly the KEY BINDINGS and EXTENDED SEARCH MODE sections:

* Typing most normal keys -- a-z, A-Z, 0-9, space, backspace, etc.. -- edits the current query. The query is used to find particular items. Do not confuse the query (what you are currently searching for) with the selection (the particular items you have already selected with `Tab`, typically shown with a `>` character to their left.)
* `Tab`	Toggle selection of the current tag
        (ie. select it if it isn't selected; deselect it if it is)
* `Ctrl-k`	Kill(erase) last word from query. eg `blue eye<Ctrl-k>` -> `blue`
* `Enter`	Confirm selection and exit.
* `Escape`  Cancel and exit (returns an empty selection, ie. no tags)
* `Cursor Keys`	Move through options
* `Ctrl-n/p`	Equivalent to down key and up key respectively
* `PgUp/PgDn`	Move through options a page at a time
