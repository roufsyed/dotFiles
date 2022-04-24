# Setup fzf
# ---------
if [[ ! "$PATH" == */home/rouf/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/rouf/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/rouf/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/rouf/.fzf/shell/key-bindings.bash"
