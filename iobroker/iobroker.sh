#!/bin/bash

### BEGIN INIT INFO

# Provides: iobroker.sh

# Required-Start: $network $local_fs $remote_fs

# Required-Stop:: $network $local_fs $remote_fs

# Default-Start: 2 3 4 5

# Default-Stop: 0 1 6

# Short-Description: starts ioBroker

# Description: starts ioBroker

### END INIT INFO

(( EUID )) && echo .You need to have root privileges.. && exit 1

PIDF=/opt/iobroker/node_modules/iobroker.js-controller/lib/iobroker.pid

NODECMD=/usr/bin/node

IOBROKERCMD=/opt/iobroker/node_modules/iobroker.js-controller/iobroker.js

RETVAL=0

IOBROKERUSER=root


start() {

export IOBROKER_HOME=/opt/iobroker

echo -n "Starting ioBroker"

sudo -u ${IOBROKERUSER} $NODECMD $IOBROKERCMD start

RETVAL=$?

}


stop() {

echo -n "Stopping ioBroker"

sudo -u ${IOBROKERUSER} $NODECMD $IOBROKERCMD stop

RETVAL=$?

}

case "$1" in

start)

start

;;

stop)

stop

;;

restart)

stop

start

;;

*)

echo "Usage: iobroker {start|stop|restart}"

exit 1

;;

esac

exit $RETVAL