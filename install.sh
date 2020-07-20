#!/bin/bash

. ./functions.sh

echo "Hi $(green $USER)! We're going to $(blue setup) your $(blue computer) environment."

UPDATE_PACKAGES
UPGRADE_PACKAGES

. ./install-packages.sh
. ./install-zsh-layers.sh

echo "All your shit is installed."

return 0