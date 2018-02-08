set -xU GOPATH /Users/sharadg/workspace/go
set -xU PATH $PATH /Users/sharadg/workspace/go/bin
alias vim nvim

#bobthefish

set -g theme_color_scheme solarized

function fish_greeting
  set_color $fish_color_autosuggestion
  echo "I'm completely operational, and all my circuits are functioning perfectly."
  set_color normal
end

