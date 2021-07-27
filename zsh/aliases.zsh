alias ls='ls -GFh'

alias irc='ssh leejarvis.me -t "tmux a -t irc"'

# git
alias g='git'
alias s='git status -suall'
# alias co='git checkout' # zsh function added instead
alias rb='git fetch && git rebase'
alias d='git diff'
alias cm='git add -A && git commit -m'
alias ca='git commit -a'
alias ga='git add --all .'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'
alias gb='git branch'
alias gpr='git pull --rebase'
alias gsq='ga && git commit --amend --no-edit'
alias gl='git log'
alias gca='git commit -a'
alias gcm='git commit'
alias gm='git merge'
alias gam='git commit --amend'
alias com='git checkout main'

# ruby stuff
alias be='bundle exec'
alias fs='foreman s'
alias rc='rails console'

# elixir
alias mx='mix'
alias mxx='mix test'
alias phx='iex -S mix phx.server'

alias ag="echo 'you mean rg'"
