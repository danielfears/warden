 if [ -e ~/.bashrc ] && [ ! -e ~/.bash_profile ]; then
    foo="bashrc"
  fi

  # CentOS installation support
  if [ -e ~/.bashrc ] && [ -e ~/.bash_profile ]; then
    foo="bashrc"
  fi

  # MacOS installation support
  if [ -e ~/.bash_profile ] && [ ! -e ~/.bashrc ]; then
    foo="bash_profile"
  fi