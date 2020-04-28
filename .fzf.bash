# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dgordon/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/dgordon/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dgordon/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/dgordon/.fzf/shell/key-bindings.bash"
