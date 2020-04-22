# This file contains aliases and custom functions
# written for zsh, but should be compatibile with BASH.

# You can import it using:
# source $HOME/.config/aliases.sh

# Edit i3conf
alias i3vim='vim $HOME/.config/i3/config'
# Edit nvim conf

alias awvim='vim $HOME/.config/awesome/rc.lua'
alias atvim='vim $HOME/.config/awesome/themes/steamburn/theme.lua'

alias cvim='nvim $HOME/.config/nvim/init.vim'
# Use colors for grep
alias grep='grep --color'
# Use colors for ls
alias ls='ls --color'
# Always try to nest dirs
alias mkdir='mkdir -pv'
# Connect to mcsv
alias mcssh='ssh -i .ssh/mcssh -l ninertominer 34.65.137.164'
alias monikassh='ssh -l op -i .ssh/monikamc 34.89.237.250'

# Open with sudo plugin vim
svim() {
	vim sudo:$@
}

# Replace vim with nvim
vim() {
	nvim $@
}

# Download music from youtube
ytdm() {
	youtube-dl -f 140 "ytsearch1:$*"
}

# Source private aliases (if file exists) 
if [ -f $HOME/.config/private-aliases.sh ]; then
    source $HOME/.config/private-aliases.sh;
fi
