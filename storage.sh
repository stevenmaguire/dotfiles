# Install and configure storage (databases, cache, queues)

#------------------------------
# MySQL
#------------------------------
# Let's install latest MySQL because
# the latest is ¯\_(ツ)_/¯
#
# Homebrew has really screwed the pooch with their mysql
# shenanigans. So, don't bother trying to install the service
# via homebrew - use the standalone installer instead
#
# Download the package here: https://downloads.mysql.com/archives/community/
# Installation instructions: https://dev.mysql.com/doc/mysql-osx-excerpt/5.7/en/osx-installation-pkg.html
#
# The standalone installer may include some other client binaries.
# If not, you can install the client binaries as a keg-only (non symlinked)
# package via homebrew.
brew install mysql-client

#------------------------------
# PostgreSQL
#------------------------------
brew install postgres

#------------------------------
# Redis
#------------------------------
brew install redis

#------------------------------
# Beanstalkd
#------------------------------
brew install beanstalkd

#------------------------------
# Some helpful tips
#------------------------------
echo "Tip: Run mysql_secure_installation to configure mysql users"

