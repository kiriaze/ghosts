ghosts
=====


Does 3 things, sometimes 4.

1. Creates an instance of your project within your hosts file, e.g. project.dev 127.0.0.1.
2. Creates a reference to the hosts/project within httpd-vhosts.conf by referencing your desired path to project.
3. Creates directory for you project. (Optional)
4. Restarts Apache.

`bash <(curl -s https://raw.githubusercontent.com/kiriaze/ghost/master/ghosts.sh)`

Or download it and place it with your other scripts, and run it `sh path/to/ghosts.sh`

And follow the inline instructions through CLI!
