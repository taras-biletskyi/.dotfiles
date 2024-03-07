# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# for M2
export PATH=/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

### My addition
### All these settings should go in your zshrc file, before Oh My Zsh is sourced.
true_fzf_path=$(readlink -f $(which fzf))
export FZF_BASE=$true_fzf_path
export FZF_DEFAULT_OPTS="-m -0 -1 --height 40% --min-height=10 --layout=reverse
    --border --scroll-off=5 --info=inline --history-size=100000 --no-unicode --tabstop=4
    --margin 1.5% --bind ctrl-space:toggle+down --bind tab:down --bind shift-tab:up
    --bind ctrl-g:first --bind alt-enter:toggle-all --scrollbar"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54
"
# unbind alt-enter from print-query
zstyle ':fzf-tab:*' print-query alt-a
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-space:toggle+down' 'ctrl-g:first' 'alt-enter:toggle-all'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
### My addition
autoload -Uz compinit && compinit
### My addition
# Should be before plugins and after compinit
user=$(whoami)
fzf_tab_path=$(echo "/Users/${user}/.oh-my-zsh/custom/plugins/fzf-tab/fzf-tab.plugin.zsh")
source "$fzf_tab_path"
plugins=(
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
    git
    python
    pip
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    history-substring-search
    colored-man-pages
    docker
    fzf
    fzf-tab
    gcloud
    kubectl
    # kubectx
    golang
)

### My addition
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=/Users/tb_reply/.config/completion
# for brew ocmpletion
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

source $ZSH/oh-my-zsh.sh

# TODO: sort this out
# User configuration

### My addition
export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


############### My additions ###############

# this sends a bell upon a command finish
precmd () {
  echo -n -e "\a"
}

alias py="python3"
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
alias lzg="lazygit"
alias lzd="lazydocker"

HISTSIZE=1000000
SAVEHIST=1000000

# Use this instead of `use_thin_strokes: false` in alacritty config
# defaults write -g AppleFontSmoothing -int 0

export VISUAL='nvim'
export EDITOR='nvim'
export TERM="xterm-256color"
export FPATH="/usr/local/opt/curl/share/zsh/site-functions:$FPATH"
export FPATH="/opt/homebrew/opt/curl/share/zsh/site-functions:$FPATH"

# Change zsh-autosuggestions hotkey
bindkey '^ ' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

############### nnn snippents ###############
# Quit nnn to current dir with ^G and set alias to `n`
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="$HOME/.config/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@""-H"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
# No dir auto-enter during "/" filtering
export NNN_OPTS="A"
############### nnn snippents ###############

############### fzf snippents ###############
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# ZSH
# Make all kubectl completion fzf
# !!! This should not be needed with fzf-tab plugin !!!
# command -v fzf >/dev/null 2>&1 && {
    # source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
# }
############### fzf snippents ###############
# autoload bashcompinit && bashcompinit
# completions for Azure CLI
if command -v az &> /dev/null; then
    source /usr/local/etc/bash_completion.d/az
fi
# https://minikube.sigs.k8s.io/docs/commands/completion/
# source ~/.minikube-completion
# for mysql CLI client
export PATH="/opt/homebrew/Cellar/mysql-client/8.0.32/bin:$PATH"
# for go executables
user=$(whoami)
export PATH="/Users/${user}/go/bin:$PATH"
export HOMEBREW_NO_INSTALL_FROM_API=1

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
export PATH="/Users/${user}/Library/Application Support/Coursier/bin:$PATH"

java_crib=$(brew --prefix openjdk@17)
export JAVA_HOME=${java_crib}
export PATH="${java_crib}/bin:$PATH"
# For compilers to find openjdk@17 you may need to set:
#   export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
