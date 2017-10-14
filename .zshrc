# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ZSH
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="powerlevel9k/powerlevel9k"

DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# POWERLEVEL
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm nodeenv)
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=10
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"

# Custom fonts
POWERLEVEL9K_MODE='awesome-fontconfig'

# Custom colors
POWERLEVEL9K_NVM_FOREGROUND="white"

# Icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

plugins=(git git-extras git-flow npm wd)

DEFAULT_USER=tinej

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# ZSH Cache
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Oh-My-ZSH
source $ZSH/oh-my-zsh.sh

# Load NVM
source /usr/share/nvm/init-nvm.sh

# NVM autoload nvm from .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Awesome stuff - ALIASES
alias msfconsole="msfconsole --quiet -x \"db_connect msf@msf\""
