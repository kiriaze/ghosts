#!/bin/sh

###############################################################################
# Setup
###############################################################################

pretty_print() {
  printf "\n%b\n" "$1"
}

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

# echo -e "$COL_RED This is red $COL_RESET"
# echo -e "$COL_BLUE This is blue $COL_RESET"
# echo -e "$COL_YELLOW This is yellow $COL_RESET"

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Write to hosts, httpd-vhosts files and create project directory
###############################################################################

pretty_print "$COL_GREEN Enter your project url. e.g. project.dev $COL_RESET"
  read project


pretty_print "$COL_GREEN Enter your project path. e.g. path/to/project $COL_RESET"
  read path


pretty_print "$COL_BLUE Adding ${project} to hosts file $COL_RESET"
  sudo sh -c 'echo "127.0.0.1 '$project'" >> /etc/hosts'


pretty_print "$COL_BLUE Adding ${project} path to httpd-vhosts file $COL_RESET"
  sudo sh -c 'echo "
<VirtualHost *:80>
    DocumentRoot '$path'
    ServerName '$project'
</VirtualHost>
" >> /etc/apache2/extra/httpd-vhosts.conf'


pretty_print "$COL_GREEN Would you like to create project directory at path? (y/n) $COL_RESET"
read -r response
case $response in
  [yY])
      pretty_print "$COL_GREEN Creating project directory at path $COL_RESET"
      sudo mkdir $path
      break;;
  *) break;;
esac


###############################################################################
# Restart Apache and done
###############################################################################

pretty_print "$COL_BLUE Restarting Apache yo. $COL_RESET"
  sudo apachectl restart

pretty_print "$COL_BLUE Shits Done Bro! Coming soon: ghost add project.dev path/to/project true $COL_RESET"