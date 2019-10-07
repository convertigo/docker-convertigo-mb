#!/bin/sh

if [ "$1" = "convertigo" ]; then
    
    if [ "$USE_TUNNEL" = "YES" ]; then
        /usr/local/bin/chisel server --port 28080 --reverse --socks5 --proxy http://localhost:28081 2>&1 >/var/log/chisel &
        sed -i.bak2 -e 's/"28080"/"28081"/' $CATALINA_HOME/conf/server.xml
    fi
    
    . /docker-entrypoint.sh convertigo
fi

exec "$@"