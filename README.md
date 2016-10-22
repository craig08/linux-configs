# Craig's Linux Configuration Files

## Introduction

Craig is used to Ubuntu LTS with `bash`. Therefore the setup script is written in `bash`, and common tools will be installed via built-in `apt`. Please ensure that your network works.

Current version supports Ubuntu 16.04 xenial.

### What will be setup after this script?

- `env/`
  - `.bashrc`: The `.bashrc` file is almost the same as default `.bashrc` in Ubuntu default. Only prompt, several aliases, language, and `PATH` setting are different.
  - `.tmux.conf`: A new-fashioned (or you can say "wet" in Mandarin) style of tmux.
  - `.vimrc`: Some customized functions and plugins managed by `Neobundle`.
  - `.gitconfig`: Git aliases.
- `bin/`: Will place some simple CLI tools here. The path `$HOME/linux-configs/bin` is also added to `.bashrc`.
- `scripts/`: Some useful scripts.


## Installation

Please ensure that you are login as `root` or are in sudoers to do this configuration.

```sh
$> git clone https://github.com/craig08/linux-configs.git
$> cd linux-configs
$> ./apply.sh install
```
