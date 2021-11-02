# Only load /opt/homebrew chruby version on M1
if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
  if [[ -a /opt/homebrew/opt/chruby/share/chruby/chruby.sh ]]; then
    source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
    chruby 2.6.5
  fi
else
  if [[ -a  /usr/local/opt/chruby/share/chruby/chruby.sh ]]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    chruby 2.6.5
  fi
fi
