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


It should also be noted that any general configuration of `fzf` you have made via the environment variable `FZF_DEFAULT_OPTS` is explicitly respected (eg. `ft` binds `alt-e` key combination, but if you also bound it, it won't override the `alt-e` binding)


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

ft may be invoked simply as `ft`, with no arguments.
`ft -s` skips the final 'copy to clipboard' step, outputting the selected tags directly. This is
useful with command substitution, eg `tags=$(ft -s)`.

Any other arguments provided will be passed on to fzf.
For example, you can reduce the number of terminal lines occupied by the fzf query like this:
   `ft --height=10`
(or via the `FZF_DEFAULT_OPTS` environment variable, which is documented by the fzf man page.)


There is nothing much to know about using ft: you interact with `fzf` in order to select the tags
you want, and then they are automatically copied to the clipboard. In order to use ft more
efficiently, just learn more about how to use *fzf*.

A quickstart guide to fzf, which should be augmented by viewing the fzf man page, particularly the KEY BINDINGS and EXTENDED SEARCH MODE sections:

* Typing most normal keys -- a-z, A-Z, 0-9, space, backspace, etc.. -- edits the current query. The query is used to find particular items. Do not confuse the query (what you are currently searching for) with the selection (the particular items you have already selected with `Tab`, typically shown with a `>` character to their left.)
* `Tab`	Toggle selection of the current tag, then (ft-specific override) erase query and move down in the results list
        (ie. select the item if it isn't selected; deselect it if it is).
        The 'vanilla' behaviour of fzf is only to toggle selection of the current tag.
* `Ctrl-k`	Kill(erase) last word from query. eg `blue eye<Ctrl-k>` -> `blue`
* `Ctrl-a` / `Ctrl-e`	Go to beginning of query string or end of query string respectively (also
                accessible via Home, End)
* `Enter`	Confirm selection and exit.
* `Escape`  Cancel and exit (returns an empty selection, ie. no tags)
* `Cursor Keys`	Move through options
* `Ctrl-n/p`	Equivalent to down key and up key respectively
* `PgUp/PgDn`	Move through options a page at a time

Keys which `ft` specifically binds:

* `Alt-e`	Open the e621 wiki page for the currently selected tag -
                ie. https://e621.net/wiki/show/TAGNAME .
		Uses whatever xdg-open thinks your default web browser is.

ft tries to avoid clobbering any preexisting binds in your FZF_DEFAULT_OPTS. So if you want to
`--bind=alt-e:execute(mimeo {1}&)` (supposing you prefer mimeo over xdg-open),
your bind takes precedence.



TODO
-----

* Database updates should be suggested - but not enforced -- if `ft` finds your database is old
  enough.

* Support enumeration-type metatags, eg 'rating:(s|q|e)'
  (it's possible to support ID-types like `pool:1234` , but this requires more work DB-building
   -- fetch at least the highest-used-pool-ID, but preferably all the pool names as well,
   so the user has confirmation the ID used is correct.)
    * Arbitrary-content metatags like `source:` will never be supported.

    * Tag type changing (`character:foo`) also won't be supported.

* Read existing post tags and preselect those tags. Unsure whether fzf supports preselected tags,
  though. Should at least be able to remove already-applied tags.

Won't Do
---------

Most of these things are in the area of "too individual to have a general solution".

* Global keybind for semi-integration with browser: Should be done via a terminal with
   'console'/'slide-down' support (eg.Guake, Tilda), and something like bindkey or sxhkd.
   a) not gonna depend on a specific terminal, and b) would prefer to get lhtag, my
    lighthouse-based tagging interface, released, in preference to this kind of hack.
