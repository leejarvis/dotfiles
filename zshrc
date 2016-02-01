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
HISTSIZE=5000
SAVEHIST=5000

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

source $HOME/.zsh/aliases
source $HOME/.zsh/prompt
source $HOME/.zsh/ruby

eval "$(direnv hook zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
