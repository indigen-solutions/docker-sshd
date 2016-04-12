#!/bin/bash

if [ ! -z $USER_PASSWD ]
then
    echo "user:$USER_PASSWD" | chpasswd
fi

/usr/sbin/sshd -D