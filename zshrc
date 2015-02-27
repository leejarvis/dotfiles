# environmental variables

export PS1='%~$(git_info_for_prompt)%# '
export GOPATH=$HOME/code/go
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/$HOME/code/go/bin:$PATH"

# load functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
autoload -U compinit
compinit

HISTFILE=~/.zsh/history
HISTSIZE=1000
SAVEHIST=1000

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

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
RUBIES=(~/.rubies/*)
chruby 2.2

eval "$(direnv hook zsh)"
