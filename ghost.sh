#!/bin/sh

###############################################################################
# Setup
###############################################################################

pretty_print() {
  printf "\n%b\n" "$1"
}

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Write to hosts, httpd-vhosts files and create project directory
###############################################################################

pretty_print "Enter your project url. e.g. project.dev"
  read project


pretty_print "Enter your project path. e.g. path/to/project"
  read path


pretty_print "Adding ${project} to hosts file"
  sudo sh -c 'echo "127.0.0.1 '$project'" >> /etc/hosts'


pretty_print "Adding ${project} path to httpd-vhosts file"
  sudo sh -c 'echo "
<VirtualHost *:80>
    DocumentRoot '$path'
    ServerName '$project'
</VirtualHost>
" >> /etc/apache2/extra/httpd-vhosts.conf'


pretty_print "Would you like to create project directory at path? (y/n)"
read -r response
case $response in
  [yY])
      pretty_print "Creating project directory at path"
      sudo mkdir $path
      break;;
  *) break;;
esac


###############################################################################
# Restart Apache and done
###############################################################################

pretty_print "Restarting Apache yo."
  sudo apachectl restart

pretty_print "Shits Done Bro! Coming soon: ghost add project.dev path/to/project true"