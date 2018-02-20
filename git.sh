brew install contacts

git config --global user.name "$(contacts -Hm -f '%n')"
git config --global user.email "$(contacts -Hm -f '%e')"

# https://github.com/jamiew/git-friendly
# the `push` command which copies the github compare URL to my clipboard is heaven
bash < <( curl https://raw.github.com/jamiew/git-friendly/master/install.sh)

# Type git open to open the GitHub page or website for a repository.
npm install -g git-open