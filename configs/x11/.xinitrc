#!/bin/sh
#
# Sourced by xinit on startx and other display managers
#
# I'm using LightDM which sources .xprofile, so everything is there
# here we only source it.

# TODO: debug starting with `startx`

[ -f ~/.xprofile ] && . ~/.xprofile
