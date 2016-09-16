## standard

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

## customization

PATH="$HOME/.cabal/bin:$PATH"

export ALTERNATE_EDITOR=""
export EDITOR=vi
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export PATH=$PATH:$ORACLE_HOME/bin
