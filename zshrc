# environmental variables

export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH"

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

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/ruby.zsh
source $HOME/.zsh/apple_terminal.zsh

eval "$(direnv hook zsh)"
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob \!.git'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if which spark-ansible > /dev/null; then source /etc/ansible/scripts/spark-autocomplete.sh; fi
export SPARK_USER=lee.jarvis
