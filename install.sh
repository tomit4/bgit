#!/bin/bash

# Error handling
set -e

function changeowner() {
        if command -v "doas" &> /dev/null ; then
            doas chown -R $USER:$USER ./*
        else
            sudo chown -R $USER:$USER ./*
        fi
}

changeowner

function installbgit() {
    if [[ ! -f /usr/local/bin/bgit ]] ; then
        echo 'installing bgit to /usr/local/bin ...'
        if command -v "doas" &> /dev/null ; then
            doas cp bgit /usr/local/bin/
            doas chmod 755 /usr/local/bin/bgit
        else
            sudo cp bgit /usr/local/bin/
            sudo chmod 755 /usr/local/bin/bgit
        fi
    else
        read -e -r -p "bgit already installed, would you like to reinstall?(y/n): " reinstall
        if [[ $reinstall == "y" || $reinstall == "yes" ]] ; then
            if command -v "doas" &> /dev/null ; then
                doas cp bgit /usr/local/bin/
                doas chmod 755 /usr/local/bin/bgit
            else
                sudo cp bgit /usr/local/bin/
                sudo chmod 755 /usr/local/bin/bgit
            fi
        else
            echo "install script exiting, no changes were made to bgit."
        fi
    fi
}

installbgit

function createconfig() {
    if [[ ! -d "$HOME/.config/bgit/" ]] ; then
        echo "installing configuration files in directory ~/.config/bgit/ ..."
        mkdir -p $HOME/.config/bgit/
        cp -r bgit_config/* $HOME/.config/bgit/
        chmod 755 $HOME/.config/bgit/bgit*
    else
        read -e -r -p "\~/.config/bgit directory already exists, would you like to overwrite configuration files?(y/n): " replaceconfig
        if [[ $replaceconfig == "y" || $replaceconfig == "yes" ]] ; then
            cp -r bgit_config/* $HOME/.config/bgit/
            chmod 755 $HOME/.config/bgit/bgit*
        else
            echo "install script exiting, no updates to configuration have been made ..."
            exit 0
        fi
    fi
}

createconfig

function installman() {
    if [[ -d "/usr/share/man/man1" ]] ; then
        echo "installing man page in /usr/share/man/man1 ..."
        if command -v "doas" &> /dev/null ; then
            doas cp man_page/bgit.1.gz /usr/share/man/man1/
        else
            sudo cp man_page/bgit.1.gz /usr/share/man/man1/
        fi
    else
        echo "/usr/share/man/man1 doesn't exist, copy bgit.1.gz to preferred man page directory manually"
        exit 0
    fi
}

installman
