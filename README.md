# https://github.com/waltlenu/dotfiles

Accommodating idiosyncrasies, because:

> "There's no place like ::1/128"



### Installation

If `chezmoi` is not installed on the your host, then execute the install [script](install.sh):

```bash
curl https://raw.githubusercontent.com/waltlenu/dotfiles/master/install.sh
```

Please note that it's a pretty straightforward script that was generated with `chezmoi generate install.sh` and wraps 
 `chezmoi`'s own install script, which is much more **important** and worth of a fetch-read-review:

```bash
curl -fsSL https://get.chezmoi.io
```

## Personal Preferences

I use(d) a variety of hardware, operating systems and interfaces, and I'm not overly attached to any (except Amiga, nothing will ever be as good as an Amiga 🤣) but I seem to prefer either MacOS or ArchLinux/Sway/Zsh as of late. I'm always on the lookout for interesting tools.

I've maintained this repo since 2015 (!), refactored it many times, tested more than a dozen workflows in as many branches:

- a combination of shell and Python scripts
- tools like `stow`
- configuration management tools like `ansible`, `saltstack` and `converge`
- `Nix`
- even abused `terraform` for a while (!)
- I've settled on [chezmoi.io](https://www.chezmoi.io) because it suits my needs perfectly. For now, at least 😉

## TODO

- I run [Shellcheck](https://github.com/koalaman/shellcheck) over every shell script but the repo could use some more syntax and spell checking, as well as linting
- Ideally the testing would be automated, either/both invoked locally with `Makefile`/`Taskfile` and through CI

## Feedback

Suggestions/improvements
[welcome](https://github.com/waltlenu/dotfiles/issues)!

## Thanks to…

* [Ben Alman](http://benalman.com) for introducing me to the concept of a [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Tom Payne](https://github.com/twpayne) for building [chezmoi.io](https://www.chezmoi.io)

* Every sysadmin, developer, engineer I ~~ripped off~~ learned from. I've read _a lot_ of these:
  - https://project-awesome.org/webpro/awesome-dotfiles
  - https://dotfiles.github.io
