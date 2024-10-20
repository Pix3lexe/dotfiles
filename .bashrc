#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias vim='nvim'
alias ll='ls -alF'
alias la='ls -A'
alias cd..='cd ..'
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias sshdv='ssh dv624236@troom1gw.zam.kfa-juelich.de'
alias rmorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias x='chmod u+x'
alias saveconf='/home/simon/backups/gnome_saveconf.sh'

export PATH="$PATH:$HOME/.local/bin"
eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin.omp.json)"
export EDITOR="nvim"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:~/packages/icat/"
eval "$(pyenv init -)"
