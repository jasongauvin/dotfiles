#!/bin/bash

default() { echo "\e[0;00m$1\e[0m"; }
red()     { echo "\e[0;31m$1\e[0m"; }
green()   { echo "\e[0;32m$1\e[0m"; }
yellow()  { echo "\e[0;33m$1\e[0m"; }
blue()    { echo "\e[0;34m$1\e[0m"; }
magenta() { echo "\e[0;35m$1\e[0m"; }
cyan()    { echo "\e[0;36m$1\e[0m"; }

function UPDATE_PACKAGES() {
  INSTALL_STATUS '-' "Update package"
  sudo apt update
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' "Update package"
    return 0;
  else
    INSTALL_STATUS 'x' "Update package"
    return 1
  fi
}

function UPGRADE_PACKAGES() {
  INSTALL_STATUS '-' "Upgrade package"
  sudo apt upgrade
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' "Upgrade package"
    return 0;
  else
    INSTALL_STATUS 'x' "Upgrade package"
    return 1
  fi
}

function INSTALL_STATUS() {
  if [[ "$1" = "x" ]] ; then
    echo "$(red '[x]') $(blue $2) not installed."
  elif  [[ "$1" = "-" ]] ; then
    echo "$(yellow '[-]') $(blue $2) installing..."
  elif  [[ "$1" = "v" ]] ; then
    echo "$(green '[v]') $(blue $2) successfully installed !"
  fi 
}

function INSTALL_PACKAGE() {
  INSTALL_STATUS '-' \'"$1"\'
  apt install $1 -y
  if [[ "$?" = 0 ]] ; then
    INSTALL_STATUS 'v' \'"$1"\'
    return 0;
  else
    INSTALL_STATUS 'x' \'"$1"\'
    return 1
  fi
}