set -xU GOPATH /Users/sharadg/workspace/go
set --universal fish_user_paths /Users/sharadg/workspace/go/bin
alias vim nvim



#bobthefish

set -g theme_color_scheme solarized-dark
set -g theme_display_hostname yes
set -g theme_display_k8s_context yes

function fish_greeting
  set_color $fish_color_autosuggestion
  echo "I'm completely operational, and all my circuits are functioning perfectly."
  set_color normal
end

#keychain
if status --is-interactive
    keychain --quiet --agents ssh 
end

begin
    set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
        source ~/.keychain/$HOSTNAME-fish
    end
end
#keychain end 

#yinit 
set -gx SSH_AUTH_SOCK $HOME/.yubiagent/sock
#yinit --end 

alias git=hub
