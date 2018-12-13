#!/bin/bash

# Ubuntu installation support
  if [ -e ~/.bashrc ] && [ ! -e ~/.bash_profile ]; then

    echo 'alias warden-add="sudo sh ~/opt/warden/warden-add.sh"' >> ~/.bashrc
    echo 'alias warden-help="sudo sh ~/opt/warden/warden-help.sh"' >> ~/.bashrc
    echo 'alias warden-list="sudo sh ~/opt/warden/warden-list.sh"' >> ~/.bashrc
    echo 'alias warden-remove="sudo sh ~/opt/warden/warden-remove.sh"' >> ~/.bashrc
    echo 'alias warden-source="sudo sh ~/opt/warden/warden-source.sh"' >> ~/.bashrc
    echo 'alias warden-uninstall="sudo sh ~/opt/warden/warden-uninstall.sh"' >> ~/.bashrc
    
    . ~/.bashrc

  fi

  # CentOS installation support
  if [ -e ~/.bashrc ] && [ -e ~/.bash_profile ]; then

    echo 'alias warden-add="sudo sh ~/opt/warden/warden-add.sh"' >> ~/.bashrc
    echo 'alias warden-help="sudo sh ~/opt/warden/warden-help.sh"' >> ~/.bashrc
    echo 'alias warden-list="sudo sh ~/opt/warden/warden-list.sh"' >> ~/.bashrc
    echo 'alias warden-remove="sudo sh ~/opt/warden/warden-remove.sh"' >> ~/.bashrc
    echo 'alias warden-source="sudo sh ~/opt/warden/warden-source.sh"' >> ~/.bashrc
    echo 'alias warden-uninstall="sudo sh ~/opt/warden/warden-uninstall.sh"' >> ~/.bashrc

    . ~/.bashrc

  fi

  # MacOS installation support
  if [ -e ~/.bash_profile ] && [ ! -e ~/.bashrc ]; then

    echo 'alias warden-add="sudo sh ~/opt/warden/warden-add.sh"' >> ~/.bash_profile
    echo 'alias warden-help="sudo sh ~/opt/warden/warden-help.sh"' >> ~/.bash_profile
    echo 'alias warden-list="sudo sh ~/opt/warden/warden-list.sh"' >> ~/.bash_profile
    echo 'alias warden-remove="sudo sh ~/opt/warden/warden-remove.sh"' >> ~/.bash_profile
    echo 'alias warden-source="sudo sh ~/opt/warden/warden-source.sh"' >> ~/.bash_profile
    echo 'alias warden-uninstall="sudo sh ~/opt/warden/warden-uninstall.sh"' >> ~/.bash_profile

    . ~/.bash_profile

  fi