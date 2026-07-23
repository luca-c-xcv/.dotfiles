alias ls="ls -1 --color=auto"
alias clipcopy="xclip -selection clipboard"
alias dmount="udisksctl mount -b"
alias dunmount='function _unmount_poweroff() { udisksctl unmount -b "$1"; udisksctl power-off -b "$1"; echo -e "off $1."; }; _unmount_poweroff'
alias diff='function _mydiff() { diff -y --color=always "$1" "$2" | cat -n | grep -v -e "($"; }; _mydiff'
alias confssh='vim $HOME/.ssh/config'
alias i3conf='vim $HOME/.config/i3/config'
alias now="date +'%d%m%y-%H%M%S'"
alias scalescreen="xrandr --output $1 --scale $2"
alias spaceusage="du -hd1 $1 | sort -h"
alias lz="lazygit"
alias gitconflict="~/.local/bin/git-conflict-solver.sh"
alias dotfile="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias mount_desktop="sshfs -o default_permissions desktop:/home/luca /mnt/luca@desktop"
alias unmount_desktop="umount /mnt/luca@desktop"
