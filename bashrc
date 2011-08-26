#!/bin/bash
# ~/.bashrc

# used for bash non-login shells.
# non-login shells include:
# * X sessions (xdm, gdm, kdm)
# * X Terminals (xterm, konsole, gnome-terminal)
# * running remote commands via ssh

# git over ssh doesn't like anything being printed to stdout, so redirecting stdout to stderr
. $HOME/etc/mybashrc 1>&2 

# source /etc/bash.bashrc
