# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# Type git open to open the GitHub page or website for a repository.
npm install -g git-open

# Create code home
mkdir -p $HOME/Projects
sudo chown -R $(whoami) $HOME/Projects
