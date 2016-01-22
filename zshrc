# environmental variables

export GOPATH=$HOME/code/go
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/$HOME/code/go/bin:$PATH"

export VISUAL=vim
export EDITOR=$VISUAL
# use emacs mode, using vi-mode for zsh breaks history search I'm so used to
bindkey -e

# load functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
autoload -U compinit && compinit
autoload -U colors && colors

HISTFILE=~/.zsh/history
HISTSIZE=2000
SAVEHIST=2000

# zsh options
setopt AUTOCD
setopt EXTENDEDGLOB
setopt NOCASEGLOB
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS
setopt LOCAL_TRAPS
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt PROMPT_SUBST

# prompt
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%{$fg[yellow]%} U"
zstyle ':vcs_info:*' stagedstr "%{$fg[yellow]%} S"
zstyle ':vcs_info:*' formats "[%{$fg[green]%}%b%u%c%{$reset_color%}]"
zstyle ':vcs_info:*' actionformats "[%{$fg[green]%}%b%{$reset_color%}(%{$fg[red]%}%a%{$reset_color%})%u%c%{$reset_color%}]"
precmd() { vcs_info }
export PROMPT='%~${vcs_info_msg_0_}%# '

source $HOME/.zsh/aliases

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
RUBIES=(~/.rubies/*)
chruby 2.2.2

eval "$(direnv hook zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
