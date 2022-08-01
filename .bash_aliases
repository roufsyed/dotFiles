# fzf alias for extended search, preview and multiple select via tab & shift tab
alias fzf="fzf --extended -m --preview='bat {} --color=always' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias e='exit'
alias c='clear'

#Tmux alises
alias tks='tmux kill-session'
alias tkst='tmux kill-session -t'
alias tl="tmux ls"

# Git alias
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gp='git push origin'
alias gl='git log --oneline --decorate'

# Directory and files aliases
alias Downloads='cd ~/Downloads'
alias Documents='cd ~/Documents'
alias Desktop='cd ~/Desktop'
alias Pictures='cd ~/Pictures'
alias scripts='cd ~/scripts'
alias Data='cd /media/rouf/Data'
alias programmingData='cd ~/programmingData/'
alias androidProjects='cd ~/programmingData/androidProjects'
alias dsa='cd ~/programmingData/dsa'
alias reactjs='cd ~/programmingData/reactjs'
alias java='cd ~/programmingData/java'
alias config='cd ~/.config/'
alias nvimConfig='cd ~/.config/nvim/'
alias i3Config='nvim ~/.config/i3/config'
alias i3statusConfig='nvim ~/.config/i3status/config'
alias bashrc='nvim ~/.bashrc'
alias bashAliases='nvim ~/.bash_aliases'
alias alacrittyConfig='nvim ~/.config/alacritty/alacritty.yml'
alias obsidianConfig='nvim ~/Documents/"Obsidian Vault"/".obsidian.vimrc"'
alias todo='nvim ~/todos'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Network
alias ping='ping -c 8 www.google.com'
