# FZF settings: key bindings (Ctrl-T files, Ctrl-R history, Alt-C cd) + theme matching alacritty/tmux
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
[ -f /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf

export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*" 2>/dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='find . -type d -not -path "*/.git/*" -not -path "*/node_modules/*" 2>/dev/null'

# Colors follow the alacritty palette (bg #131618) and tmux accent colours
export FZF_DEFAULT_OPTS="
  --height=40% --layout=reverse --border=rounded --info=inline
  --bind='ctrl-/:toggle-preview,ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'
  --color=bg:#131618,bg+:#1f2427,fg:#d3d7cf,fg+:#ffffff
  --color=hl:#729fcf,hl+:#34e2e2,info:#c4a000,prompt:#8ae234
  --color=pointer:#ef2929,marker:#fce94f,spinner:#ad7fa8,header:#555753,border:#555753"

export FZF_CTRL_T_OPTS="--preview 'head -n 100 {}' --preview-window=right:50%:hidden"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window=down:3:wrap:hidden"
export FZF_ALT_C_OPTS="--preview 'ls -A --color=always {}' --preview-window=right:50%:hidden"
