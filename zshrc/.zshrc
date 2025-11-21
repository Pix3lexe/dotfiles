export PATH="$PATH:$HOME/.local/bin"
# pfetch
# cowsay -r $(fortune)
# fortune | chara say -r | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit and plugins dir
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if not already installed
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'   # lighter gray

# zsh-syntax-highlighting mappings from kitty theme
# Main accent: blue (color4)
ZSH_HIGHLIGHT_STYLES[command]='fg=4'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=4'
ZSH_HIGHLIGHT_STYLES[function]='fg=4'
ZSH_HIGHLIGHT_STYLES[alias]='fg=4'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=4'

# Errors: red (color1)
ZSH_HIGHLIGHT_STYLES[error]='fg=1,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=1,bold'

# Variables & parameters: green (color2)
ZSH_HIGHLIGHT_STYLES[variable]='fg=2'
ZSH_HIGHLIGHT_STYLES[parameter]='fg=2'
ZSH_HIGHLIGHT_STYLES[special-param]='fg=2,bold'

# Paths & directories: cyan (color6)
ZSH_HIGHLIGHT_STYLES[path]='fg=6'
ZSH_HIGHLIGHT_STYLES[dir]='fg=6,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=6'

# Options: yellow (color3)
ZSH_HIGHLIGHT_STYLES[option]='fg=3'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=3'
ZSH_HIGHLIGHT_STYLES[assignment]='fg=3'

# Strings: magenta (color5)
ZSH_HIGHLIGHT_STYLES[single-quoted]='fg=5'
ZSH_HIGHLIGHT_STYLES[double-quoted]='fg=5'
ZSH_HIGHLIGHT_STYLES[back-quoted]='fg=5'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=5,bold'

# Comments: subdued white (color7)
ZSH_HIGHLIGHT_STYLES[comment]='fg=7,italic'

# Operators & delimiters: blue (color4)
ZSH_HIGHLIGHT_STYLES[operator]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[delimiter]='fg=4'
ZSH_HIGHLIGHT_STYLES[brackets]='fg=4,bold'
ZSH_HIGHLIGHT_STYLES[backslash]='fg=4'

# Default text
ZSH_HIGHLIGHT_STYLES[default]='fg=7'

# keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# history
HISTSIZE=3000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion syling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# aliases
alias ls='ls --color'
alias ll='ls -lisa'
alias cd..='cd ..'
alias rmorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias x='chmod u+x'
alias c='clear'
alias nv='nvim'
alias dockfix='$HOME/backups/dockfix.sh'
alias saveconf='/home/simon/backups/gnome_saveconf.sh'
alias lg='lazygit'
alias yz='yazi'

# shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
export EDITOR="nvim"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im-fcitx'

_fix_cursor(){
    echo -ne '\e[3 q'
}
precmd_functions+=(_fix_cursor)
