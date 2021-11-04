#!/bin/bash
cp /etc/redis/redis.conf /etc/redis/redis.conf.orig
sed -ie "s/# requirepass foobared/requirepass $REDIS_PASSWORD/g" /etc/redis/redis.conf
sed -ie "s/daemonize yes/daemonize no/g" /etc/redis/redis.conf
sed -ie "s/bind 127.0.0.1 ::1/bind 0.0.0.0/g" /etc/redis/redis.conf
sed -ie "s/supervised no/supervised upstart/g" /etc/redis/redis.conf
sed -ie '$a\'$'\n''maxmemory 256mb' /etc/redis/redis.conf
sed -ie '$a\'$'\n''maxmemory-policy allkeys-lru' /etc/redis/redis.conf

sleep 20

redis-server /etc/redis/redis.conf