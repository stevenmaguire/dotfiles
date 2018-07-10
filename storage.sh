# Install and configure storage (databases, cache, queues)

#------------------------------
# MySQL
#------------------------------
# Let's install latest MySQL because 
# the latest is ¯\_(ツ)_/¯
brew install mysql
mysql.server stop
MY_DAMN_PASSWORD="root"
CONF_FILE=".my.cnf"
touch ~/$CONF_FILE
cat > ~/$CONF_FILE <<EOF
[mysqld]
default-authentication-plugin=mysql_native_password
EOF
mysql.server start
mysql -u root -p$MY_DAMN_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MY_DAMN_PASSWORD';"
mysql.server stop

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

