#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH=$HOME/.cargo/bin:/opt/homebrew/bin:$HOME/.sdkman/candidates/maven/current/bin:$HOME/.sdkman/candidates/leiningen/current/bin:$HOME/.sdkman/candidates/java/current/bin:$HOME/.rbenv/shims:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

. "$HOME/.cargo/env"
