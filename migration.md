## Other parts of migrating to a new mac, when not using migration assistant but instead doing piecemeal migration.

* [ ] .app's I really want and aren't in my caskfile.
* [ ] read `brew list` and `brew cask list` to see whats worth reinstalling

* [ ] read `npm list -g --depth=0` to see global npm packages

* [ ] archive .bash_history, probably don't want to import it.
* [ ] Wifi Settings and passwords
  *  `/Volumes/MacintoshHD/Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist`
* [ ] `.extra`
* [ ] .ssh and .gnupg
* [ ] .osx settings
  * more? https://github.com/hjuutilainen/dotfiles/blob/master/bin/osx-user-defaults.sh
  * symlink https://github.com/mathiasbynens/dotfiles/pull/301
  * great stuff https://github.com/paulmillr/dotfiles

* [ ] Limechat settings
  * `~/Library/Preferences/net.limechat.LimeChat.plist`
* [ ] Automator scripts
  * `~/Library/Services`
* [ ] Timestats stats
  * gotta export into JSON through their UI. save somewhere hilarious

* [ ] Documents folder
* [ ] Photobooth pics (in dropbox)  : ~/Dropbox/Public/cam
* [ ] Finder settings and TotalFinder settings
  * Not sure how to do this yet. Really want to.

* [ ] Chrome profiles and config flags? Nah
* [ ] current tabs (via onetab)
