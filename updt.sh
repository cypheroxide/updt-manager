#!/bin/bash

# UPDT -- Debian/Ubuntu Full System Update Tool (Version 1.0)
# Advanced command to facilitate the full update and upgrading of the system:  "updt" Adding the option "--clean" will
# remove orphaned packages and auto-clean the apt cache. (December 2020)
# By CypherOxide https://github.com/cypheroxide (GNU/General Public License version 2.0)

# Set BASH to quit script and exit on errors:

set -e

# Functions:

update() {

echo "Starting full system update..."
sudo apt-update
sudo full-upgrade -yy

}

clean() {

echo "Cleaning up..."
sudo apt autoremove -yy
sudo apt autoclean
sudo apt purge

}

leave() {

echo "--------------------"
echo "- Update Complete! -"
echo "--------------------"
exit

}

updt-help() {

cat << _EOF_

 UPDT is a tool that automates the update procedure for Debian/Ubuntu based Linux systems.

 Commands:
    updt = full system update.

    Running "updt" with no options will update the apt cache and the perfrom a full
    distribution update automatically.

    updt --clean = full system update with cleanup.

    Adding the "--clean" option will invoke the apt commands to search for and remove locally
    cached packages that are no longer in the repositories and remove orphaned packages that
    are no long needed by programs.

    updt --help = shows this help page

 By CypherOxide https://github.com/cypheroxide (GNU/General Public License version 2.0)

_EOF_

}

# Execution.

# Tell 'em who we are...

echo "UPDT -- Debian/Ubuntu Full System Update Tool (Version 1.0)"

# Update and clean:

if [ "$1" == "--clean" ]; then
   update
   clean
   leave
fi

if [ "$1" == "--help" ]; then
   updt --help
   exit
fi

# Check for invalid arguement

if [ -n "$1"  ]; then
   echo "Updt Error: Invalid argument. Try 'updt --help' for more info." >&2
   exit 1
fi

update
leave
