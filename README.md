ghosts
=====


Does 3 things, sometimes 4.

1. Creates an instance of your project within your hosts file, e.g. project.dev 127.0.0.1.
2. Creates a reference to the hosts/project within httpd-vhosts.conf by referencing your desired path to project.
3. Creates directory for you project. (Optional)
4. Restarts Apache.

Run this from anywhere:
`bash <(curl -s https://raw.githubusercontent.com/kiriaze/ghost/master/ghosts.sh)`

Preferred method would be to:

1. Download it and place it with your other scripts, e.g. /Users/{username}/Documents/Scripts/ghosts.sh or `cd /Users/$(whoami)/Scripts/ghosts.sh` and run `curl -O https://raw.githubusercontent.com/kiriaze/ghost/master/ghosts.sh` to save it there.
2. Make it executable `chmod u+x ghosts.sh`
3. Create an alias: `nano .bash_profile`
4. Add `alias ghosts="/Users/$(whoami)/Scripts/ghosts.sh"`
5. Apply changes to bash file: `source ~/.bash_profile`
6. Run it: `ghosts`

And follow the inline instructions through the CLI!
