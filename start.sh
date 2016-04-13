#!/bin/bash
[ -z "$SSH_ROOT_PASSWD" ]   && SSH_ROOT_PASSWD=root
[ -z "$SSH_USER_UID" ]      && SSH_USER_UID=1000
[ -z "$SSH_USER_GID" ]      && SSH_USER_GID=1000
[ -z "$SSH_USER_GROUP" ]    && SSH_USER_GROUP=users
[ -z "$SSH_USER_NAME" ]     && SSH_USER_NAME=user
[ -z "$SSH_USER_PASSWD" ]   && SSH_USER_PASSWD=password
[ -z "$SSH_USER_HOME" ]     && SSH_USER_HOME=/

echo "root:x:0:0:root:/root:/usr/bin/zsh" > /etc/passwd
echo "sshd:x:104:65534::/var/run/sshd:/usr/sbin/nologin" >> /etc/passwd
echo "root:x:0:root" > /etc/group
echo "nogroup:x:65534:" >> /etc/group

addgroup --system --gid $SSH_USER_GID $SSH_USER_GROUP
adduser --home $SSH_USER_HOME --system --uid $SSH_USER_UID --gid $SSH_USER_GID --shell /bin/bash $SSH_USER_NAME

echo "root:$SSH_ROOT_PASSWD" | chpasswd
echo "$SSH_USER_NAME:$SSH_USER_PASSWD" | chpasswd

exec /usr/sbin/sshd -D