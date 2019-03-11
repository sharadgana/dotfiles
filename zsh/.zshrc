# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/workspace/go/bin:$HOME/workspace/yahoo/kubectl_conf:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/sharadg/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(  
  thefuck
  git
  sudo
  z
  kubectl
  fzf
  zsh-autosuggestions
)

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# User configuration

# Powerline Configuration 
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext)
POWERLEVEL9K_KUBECONTEXT_BACKGROUND='none'
POWERLEVEL9K_KUBECONTEXT_FOREGROUND='008'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'


#Colorls
source $(dirname $(gem which colorls))/tab_complete.sh
alias ls='colorls -lA --sd --light'
alias ll='colorls -lA --sd --light'

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GOPATH=$HOME/workspace/go
#eval `keychain -q --eval ~/.ssh/id_rsa`
export SSH_AUTH_SOCK=$HOME/.yubiagent/sock

PATH="/Users/sharadg/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/sharadg/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/sharadg/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/sharadg/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/sharadg/perl5"; export PERL_MM_OPT;

export PLATFORM_DIR=$HOME/workspace/go/src/go.corp.yahoo.com/go/go-simple

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#FZF 
#fe() {
#  local files
#  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
#  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
#}
#cdf() {
#   local file
#   local dir
#   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
#}
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/workspace/yahoo/kubectl_conf:$PATH"
alias vim=nvim
export EDITOR=nvim

export SSH_AUTH_SOCK=/Users/sharadg/.yubiagent/sock

export SSH_AUTH_SOCK=/Users/sharadg/.yubiagent/sock

kns() {
    kubectl config set-context $(kubectl config current-context) --namespace=$1
}

krand() {
     kubectl exec -it $(kubectl get pods | grep $1 | head -n 1 | awk {'print $1'}) -c $1 bash
 }

 kspec() {
     kubectl exec -it $1 -c $2 bash
 }
