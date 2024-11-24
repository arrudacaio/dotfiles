# Environment variables
export NODE_ENV="development"

# Font Awesome npm key

# Aliases
alias zsc="code ~/.zshrc"
alias zs="source ~/.zshrc"


# ZSH Variables
export ZSH_THEME="spaceship"
export PATH=/usr/local/share/npm/bin:$PATH


CASE_SENSITIVE="false"

# ZSH Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  asdf
  dotenv sudo
  gcloud
  node npm
  docker docker-compose
  )
autoload -U compinit && compinit
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source <(/usr/local/bin/starship init zsh --print-full-init)


## zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

zinit ice from'gh-r' as'program'
zinit light sei40kr/fast-alias-tips-bin
zinit light sei40kr/zsh-fast-alias-tips

# FZF
 zinit ice from="gh-r" as="command" bpick="*darwin*"
 zinit light junegunn/fzf
 zinit ice lucid wait'0c' as="command" id-as="junegunn/fzf-tmux" pick="bin/fzf-tmux"
 zinit light junegunn/fzf
 zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as="junegunn/fzf_completions" pick="/dev/null"
 zinit light junegunn/fzf
 zinit ice wait="1" lucid
 zinit light Aloxaf/fzf-tab


zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
