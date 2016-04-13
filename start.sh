#!/bin/bash

if [ ! -z $SSH_USER_PASSWD ]
then
    echo "user:$SSH_USER_PASSWD" | chpasswd
fi

/usr/sbin/sshd -D