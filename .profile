# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


export DART_SDK="/home/luca/Develop/dart/dart-sdk_2.19.6"
export JAVA_HOME="/home/luca/Develop/java/jdk-21.0.1"
export PATH="$JAVA_HOME/bin:$DART_SDK/bin:$PATH"
export GTK3_RC_FILES="$HOME/.config/gtk-3.0/settings.ini"



export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=vim
export VISUAL=vim
export ENV_TYPE="work"
