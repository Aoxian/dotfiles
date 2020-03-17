# shell
alias vim='nvim'
alias ll='ls -lGa'

# git
alias gl='clear && git log --all --decorate --oneline --graph'
alias ga='git add .'
alias gc='git commit'
alias gs='clear && git status'

# elixir
alias emt='clear && mix test'
alias eet='cd assets/elm && elm-test && cd ../..'

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/iang/.travis/travis.sh ] && source /Users/iang/.travis/travis.sh
export PATH="/usr/local/opt/openjdk/bin:$PATH"
