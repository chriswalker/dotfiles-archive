#
# .zshrc
#
# @author chris
# @date   05/04/2015
#

#
# Initialisation
# -----------------------------------------------------------------------------

# History config
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# General settings
setopt appendhistory autocd notify

# Switch off beeping
unsetopt beep

# Vim bindings on prompt
bindkey -v

# Bind Ctrl-R to reverse incremental search
bindkey "^R" history-incremental-search-backward

# No delays on keypresses
export KEYTIMEOUT=1

#
# Completion 
# -----------------------------------------------------------------------------

autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

#
# Prompt stuff (under construction)
# -----------------------------------------------------------------------------

# Some aliases for the colours, to keep the prompt strings looking sane(ish)
cyan='%{$fg[cyan]%}'
bg_blue='%{$bg[blue]%}'
yellow='%{$fg[yellow]%}'
blue='%{$fg[blue]%}'
green='%{$fg[green]%}'
bg_green='%{$bg[green]%}'
bg_black='%{$bg[black]%}'
black='%{$fg[black]%}'
white='%{$fg[white]%}'

reset='%{$reset_color%}'

# Aliases for some formats
cmdtime="%D{%H:%M:%S}"

# Remove indent for right hand side prompt
ZLE_RPROMPT_INDENT=0

autoload -U colors && colors
#autoload -Uz vcs_info

#autoload -U promptinit && promptinit

# vcs_info strings
#zstyle ':vcs_info:*' enable git svn 
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:(git)*' formats '[g/%r-%b:%u]'
#zstyle ':vcs_info:(svn)*' formats '[s/%r-%b]'

setopt prompt_subst

# Default left prompt strings; one for insert mode for vim bindings, one for
# Command mode
NORMAL_PROMPT="${blue}${cmdtime} [%n@%m]${reset} %# " 
VIM_CMD_PROMPT="${bg_blue}${black}${cmdtime} [%n@%m]${reset} %# "

# Set up the left-hand side prompt depending on whether we're in Vim's Command
# mode or not
function zle-line-init zle-keymap-select {
  PROMPT="${${KEYMAP/vicmd/$VIM_CMD_PROMPT}/(main|viins)/$NORMAL_PROMPT}"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Execute each time prompt is displayed
#precmd() {
#  vcs_info
#}

# RPROMPT set up normally, only the left-hand-side prompt handled by the widgets above
#RPROMPT='${green}${vcs_info_msg_0_}${reset}'
RPROMPT="${yellow}%~${reset}"

#
# Set up various path entries
# -----------------------------------------------------------------------------

# Android
ANDROID_SDK_PATH=~/Dev/lib/Android/android-sdk-mac_86
export PATH=$PATH:~/bin:$ANDROID_SDK_PATH/platform-tools:$ANDROID_SDK_PATH/tools

# Go
export GOROOT=/usr/local/Cellar/go/1.6/libexec
export GOPATH=~/Dev/Projects/Go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home
# Apple's own JRE 1.6
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
export JDK_HOME=$JAVA_HOME

#
# Functions
# -----------------------------------------------------------------------------

dash() {
  o dash://$1
}

#
# Aliases
# -----------------------------------------------------------------------------

alias ls='ls -GFh'
alias h='history'
alias history='history -t "[%d/%m/%y %T]"'
alias grep='grep --color=auto'
# Alias Vim's less script to normal less
alias less='/usr/local/Cellar/vim/7.4.1468/share/vim/vim74/macros/less.sh $1'
# Top display in CPU decending order
alias top='top -o cpu'

# Mac-specific
alias ql='qlmanage -p'
alias httpconf='cd /private/etc/apache2/'
alias o='open'
alias dsh=dash

# suffix-oriented aliases (usually opening Vim, ahem)
alias -s htm=vim
alias -s html=vim
alias -s java=vim
alias -s css=vim
alias -s js=vim
alias -s json=vim
alias -s go=vim
# ql-related ones?
# Markdown ones?
# Browser ones?
 
#
# Misc
# -----------------------------------------------------------------------------

# NVM (for Node management)
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#
# Shell plugins
# -----------------------------------------------------------------------------
source $HOME/dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]='none'

#
# Client-speciic config; not stored in repo
# -----------------------------------------------------------------------------
# source $HOME/dotfiles/.zsh/work.zsh

