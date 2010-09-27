#!/bin/zsh

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# completion
autoload -U compinit
compinit

# ./ssh/config hostname completion
if [ -s "$HOME/.ssh/config" ]; then
  hosts=(`hostname` `grep "Host " ~/.ssh/config | cut -d " " -f2`)
  zstyle '*' hosts $hosts
fi

# history
HISTSIZE=2000
HISTFILE="$HOME/.histfile"
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # ignore history duplicates
setopt autocd # cd is just 2 many characters, har
setopt extendedglob # sex

# ALIASES HUZZAH
alias ls='ls --color'
alias grep='grep --color'
alias mkdir='mkdir -p'
alias g='2>/dev/null gvim --servername vroom --remote-tab'

# Set PS1 with colour dependant on hostname
local red="%{"$'\e[1;31m'"%}"
local green="%{"$'\e[1;32m'"%}"
local yellow="%{"$'\e[1;33m'"%}"
local none="%{"$'\e[0m'"%}"
local colour
case `hostname` in
  "bebop") colour=$yellow ;;
"bernard") colour=$green ;;
        *) colour=$red ;;
esac
PS1="[${colour}%~${none}] %% "

# Add our ~/bin directory to the PATH
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

export RUBYLIB="$HOME/code/ramaze/lib:$HOME/code/innate/lib"

export EDITOR="vim"
export PATH=".:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
