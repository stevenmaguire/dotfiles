# Install and configure storage (databases, cache, queues)

#------------------------------
# MySQL
#------------------------------
# Let's install latest MySQL because
# the latest is ¯\_(ツ)_/¯
#
# Homebrew has really screwed the pooch with their mysql
# shenanigans.
#
# brew install mysql
# brew services stop mysql
# MY_DAMN_PASSWORD="root"
# CONF_FILE="$(brew --prefix)/etc/my.cnf"
# touch $CONF_FILE
# cat > $CONF_FILE <<EOF
# # Default Homebrew MySQL server config
# [mysqld]
# # Only allow connections from localhost
# bind-address = 127.0.0.1
# default-authentication-plugin=mysql_native_password
# EOF
# brew services start mysql
# sleep 3
# mysql -u root -p$MY_DAMN_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MY_DAMN_PASSWORD';"
# brew services stop mysql

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

