alias ls="ls -1 --color=auto"
#alias vim="nvim"
alias clipcopy="xclip -selection clipboard"
alias dmount="udisksctl mount -b"
alias dunmount='function _unmount_poweroff() { udisksctl unmount -b "$1"; udisksctl power-off -b "$1"; echo -e "off $1."; }; _unmount_poweroff'
alias diff='function _mydiff() { diff -y --color=always "$1" "$2" | cat -n | grep -v -e "($"; }; _mydiff'
alias confssh='vim $HOME/.ssh/config'
alias i3conf='vim $HOME/.config/i3/config'
alias loalias='cat $HOME/Develop/utils/tools/serverAliases | xclip -selection clipboard'
alias now="date +'%d%m%y-%H%M%S'"
alias ssh="loalias && ssh"
alias chromedart="chromium  --disable-web-security --user-data-dir=~/Develop/chromeTMP/ --remote-debugging-port=9666"
alias ant_list="ant -p build.xml"
alias ant="ant -lib ../LogObject/lib/"
alias festispwd="gpg -d ~/Develop/utils/passwd.gpg | grep -A2 Festis | awk NR==3 | clipcopy"
alias mypassword="gpg -d ~/Develop/utils/passwd.gpg | grep -i -A2 $1"
alias scalescreen="xrandr --output eDP-1 --scale 0.8"
alias spaceusage="du -hd1 $1 | sort -h"
alias sctlstart="sctl env clean; sctl env up; sleep 2; sctl loas logs $1"
alias loasreload="sctl env clean; sctl loas reload; sleep 2; sctl loas logs $1"
alias lz="lazygit"

alias gitconflict="~/.local/bin/git-conflict-solver.sh"
alias dotfile="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
