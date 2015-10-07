# Create Docker Host using VirtualBox

DOCKER_MACHINE_NAME="docker.host.$(hostname)"

STATUS="$(docker-machine status $DOCKER_MACHINE_NAME 2> /dev/null)"

# Setup startup script
# https://gist.github.com/stevenmaguire/3290f93a616560e624dd
curl -sL http://git.io/vcj2P | \
    sed -e "s?{{docker-machine}}?$(which docker-machine)?" \
        -e "s?{{docker-machine-name}}?$DOCKER_MACHINE_NAME?" \
        -e "s?{{user-path}}?$(echo $PATH)?" \
    >~/Library/LaunchAgents/com.docker.machine.default.plist && \
    launchctl unload ~/Library/LaunchAgents/com.docker.machine.default.plist && \
    launchctl load ~/Library/LaunchAgents/com.docker.machine.default.plist && \
    echo "docker-machine statup script loaded."

if [ $? -eq 0 ]; then
    echo "$DOCKER_MACHINE_NAME already created."

    if [ $STATUS != "Running" ]; then
        echo "$DOCKER_MACHINE_NAME is not running, starting now."
        docker-machine restart $DOCKER_MACHINE_NAME
    fi

    echo "$DOCKER_MACHINE_NAME upgrading now."

    {
        #docker-machine upgrade $DOCKER_MACHINE_NAME
        echo "Upgrade skipped."
    } || {
        echo "Upgrading $DOCKER_MACHINE_NAME failed, exiting, try again."
        exit
    }
else
    echo "$DOCKER_MACHINE_NAME not created, creating now."
    docker-machine create --driver virtualbox $DOCKER_MACHINE_NAME
fi

# Load docker-machine variables into shell
eval "$(docker-machine env $DOCKER_MACHINE_NAME)" && echo "docker-machine env variables loaded."

# List all docker machines
docker-machine ls

# Update hosts file with new IP of docker host
sudo ./.etchosts update $DOCKER_MACHINE_NAME $(docker-machine ip $DOCKER_MACHINE_NAME)

# Declare docker images
declare -A DOCKER_IMAGES

DOCKER_IMAGES[local-beanstalkd]="docker \
  run \
  --detach \
  --name local-beanstalkd \
  --publish 11300:11300 \
  schickling/beanstalkd;"

DOCKER_IMAGES[local-elasticsearch]="docker \
  run \
  --detach \
  --name local-elasticsearch \
  --publish 9200:9200 \
  elasticsearch;"

DOCKER_IMAGES[local-memcached]="docker \
  run \
  --detach \
  --name local-memcached \
  --publish 11211:11211 \
  memcached;"

DOCKER_IMAGES[local-mongo]="docker \
  run \
  --detach \
  --name local-mongo \
  --publish 27017:27017 \
  mongo;"

DOCKER_IMAGES[local-mysql]="docker \
  run \
  --detach \
  --env MYSQL_ROOT_PASSWORD=root \
  --env MYSQL_USER=development \
  --env MYSQL_PASSWORD=development \
  --name local-mysql \
  --publish 3306:3306 \
  mysql;"

DOCKER_IMAGES[local-redis]="docker \
  run \
  --detach \
  --name local-redis \
  --publish 6379:6379 \
  redis;"

# Start containers
for K in "${!DOCKER_IMAGES[@]}"; do
    docker inspect $K &> /dev/null

    if [ $? -eq 0 ]; then
        docker restart $K
    else
        eval ${DOCKER_IMAGES[$K]};
    fi
done

# Display containers
docker ps -a

# Cleanup local variables
unset -v DOCKER_IMAGES STATUS
