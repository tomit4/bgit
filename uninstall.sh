#!/bin/bash

# Error handling
set -e

function removebgit() {
    if [[ -f /usr/local/bin/bgit ]] ; then
        if command -v "doas" &> /dev/null ; then
            doas rm /usr/local/bin/bgit
            echo "removing /usr/local/bin/bgit ..."
        else
            sudo rm /usr/local/bin/bgit
            echo "removing /usr/local/bin/bgit ..."
        fi
    fi
}

removebgit

function removeconfig() {
    if [[ -d "$HOME/.config/bgit/" ]] ; then
        echo "removing ~/.config/bgit ..."
        if command -v "doas" &> /dev/null ; then
            doas rm -r $HOME/.config/bgit
        else
            sudo rm -r $HOME/.config/bgit
        fi
    fi
}

removeconfig

function removeman() {
    if [[ -f "/usr/share/man/man1/bgit.1.gz" ]] ; then
        echo "removing man page /usr/share/man/man1/bgit.1.gz ..."
        if command -v "doas" &> /dev/null ; then
            doas rm /usr/share/man/man1/bgit.1.gz
        else
            sudo rm /usr/share/man/man1/bgit.1.gz
        fi
    fi
}

removeman
