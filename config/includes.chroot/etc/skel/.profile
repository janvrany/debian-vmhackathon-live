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

# set PATH so it includes GDB if it exists
if [ -d "/opt/gdb/bin" ] ; then
    PATH="/opt/gdb/bin:$PATH"
fi

# set PATH so it includes Smalltalk/X if it exists
if [ -d "/opt/stx/bin" ] ; then
    PATH="/opt/stx/bin:$PATH"
fi

# set STX_PACKAGEPATH for VDB
if [ -d "/opt/vdb/jv/vdb" ] ; then
	export STX_PACKAGEPATH=/opt/vdb
fi
