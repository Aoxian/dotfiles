alias ll='ls -lGa'
alias gl='git log --all --decorate --oneline --graph'
alias ga='git add .'
alias gc='git commit'
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/iang/.travis/travis.sh ] && source /Users/iang/.travis/travis.sh
export PATH="/usr/local/opt/openjdk/bin:$PATH"
