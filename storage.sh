# Install and configure storage (databases, cache, queues)

# Ask for the administrator password upfront
sudo -v

#------------------------------
# MySQL
#------------------------------
brew install mysql
unset TMPDIR
mysql.server start

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

