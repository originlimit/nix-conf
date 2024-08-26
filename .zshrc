# judeka's minimal zsh config
# startup programs (remove or add any)
pfetch
date 

# vi mode in terminal
#set -o vi  # for bash
bindkey -v  # for zsh

# prompt and colors
autoload -U colors && colors

# aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias fm='joshuto'
alias pomo='pomodoro-bar -w 40 -b 20 --cmdwork "notify-send \"Pomodoro\" \"Break time!\"" --cmdbreak "notify-send \"Pomodoro\" \"Work time!\"" --bartype xmobar'
alias g='gitui'
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias manga='mangal'
alias anime='ani-cli'
alias ani='ani-cli'
alias wiki='wiki-tui'
alias calc='fend'
alias mu='termusic'
alias zel='zellij'
alias btm='btm --battery'
alias nv='nvim'
alias em='emacs'
alias hm='home-manager'

PROMPT="%B$fg[blue]%}[%{$fg[red]%}%?%{$fg[blue]%}] %{$fg[cyan]%}%~%F{91} λ%{$reset_color%}%f%b "

# history
HISTSIZE=999
SAVEHIST=999
HISTFILE=~/.cache/zsh/history

# sourcing
export PATH="$PATH:$HOME/Programs/flutter/bin:$HOME/.npm-packages/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin"
export EDITOR="nvim"

# load zsh-syntax-highlighting; should be last.
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

