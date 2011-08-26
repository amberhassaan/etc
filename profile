#!/bin/bash

# used for bash login shells
# login shells include:
# * tty login sessions
# * ssh login sessions

# git over ssh doesn't like anything being printed to stdout, so redirecting stdout to stderr
. $HOME/etc/mybashrc 1>&2 

# . /etc/profile
