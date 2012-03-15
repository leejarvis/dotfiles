# environmental variables

if [[ -n $SSH_CONNECTION ]]; then
  export PS1='[%m] %3~$(git_info_for_prompt)%# '
else
  export PS1='%~$(git_info_for_prompt)%# '
fi

export EDITOR='vim'
export PATH="$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH"

export RUBYOPT=rubygems

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

be() {
  if [[ -a Gemfile ]]; then
    bundle exec $*
  else
    command $*
  fi
}

chpwd() {
  if [[ -s "./.env" ]]; then source ./.env; fi
}

alias rake='be rake'
alias guard='be guard'
alias cap='be cap'

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
elif [[ -d "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
