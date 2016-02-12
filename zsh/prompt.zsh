# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Version-Control-Information
setopt PROMPT_SUBST

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%{$fg[yellow]%} U"
zstyle ':vcs_info:*' stagedstr "%{$fg[yellow]%} S"
zstyle ':vcs_info:*' formats "[%{$fg[green]%}%b%u%c%{$reset_color%}]"
zstyle ':vcs_info:*' actionformats "[%{$fg[green]%}%b%{$reset_color%}(%{$fg[red]%}%a%{$reset_color%})%u%c%{$reset_color%}]"

precmd() { vcs_info }

export PROMPT='%~${vcs_info_msg_0_}%# '
