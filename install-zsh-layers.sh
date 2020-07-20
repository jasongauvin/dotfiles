#!/bin/bash

. ./functions.sh


while ~/foo; do 
    # do some work
    # write to tmp_output.txt etc.                      
    cat tmp_output.txt             # display it
    sleep 2                        # sleep and repeat
done

INSTALL_STATUS '-' 'Oh My Zsh'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo foo
if [[ "$?" = 0 ]] ; then
  INSTALL_STATUS 'v' 'Oh My Zsh'
  return 0;
else
  INSTALL_STATUS 'x' 'Oh My Zsh'
  return 1
fi


INSTALL_STATUS '-' 'zsh-syntax-highlighting'
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [[ "$?" = 0 ]] ; then
  INSTALL_STATUS 'v' 'zsh-syntax-highlighting'
  return 0;
else
  INSTALL_STATUS 'x' 'zsh-syntax-highlighting'
  return 1
fi



INSTALL_STATUS '-' 'zsh-autosuggestions
'
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [[ "$?" = 0 ]] ; then
  INSTALL_STATUS 'v' 'zsh-autosuggestions'
  return 0;
else
  INSTALL_STATUS 'x' 'zsh-autosuggestions'
  return 1
fi


INSTALL_STATUS '-' 'add plugins to Oh My Zsh'
sed -i.old "s/^plugins.*/plugins(git zsh-autosuggestions zsh-syntax-highlighting)/g" ~/.zshrc

if [[ "$?" = 0 ]] ; then
  INSTALL_STATUS 'v' 'add plugins to Oh My Zsh'
  return 0;
else
  INSTALL_STATUS 'x' 'add plugins to Oh My Zsh'
  return 1
fi

