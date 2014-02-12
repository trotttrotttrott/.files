# .files

The dot files of El Señor Christopher Douglas Trott

**Notes**

Create these directories:

* `.vim/backup`
* `.vim/tmp`

Package dependencies:

* `brew install bash-completion` - PS1
* `brew install the_silver_searcher` - ag.vim

Use homebrew installed `bash`:

* `brew install bash`
* Add `/usr/local/bin/bash` to `/etc/shells`
* `chsh -s /usr/local/bin/bash`

tmux:

* `brew install tmux`
* `brew install reattach-to-user-namespace`

Use mutt email client:

* `brew install mutt`
* `brew install urlview`

```muttrc
# ~/.mutt/accounts/your@email.com

set imap_user = "[your email]"
set smtp_url = "smtp://[your email]@smtp.gmail.com:587/"
set from = "[whatever]"
set realname = "[whatever]"

source "~/.mutt/muttrc"
```

`mutt -F ~/.mutt/your@email.com`
