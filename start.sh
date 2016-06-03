#!/bin/bash
[ -z "$SSH_ROOT_PASSWD" ]   && SSH_ROOT_PASSWD=$(dd if=/dev/urandom bs=1 count=32 | base64)
[ -z "$SSH_USER_UID" ]      && SSH_USER_UID=1000
[ -z "$SSH_USER_GID" ]      && SSH_USER_GID=1000
[ -z "$SSH_USER_GROUP" ]    && SSH_USER_GROUP=users
[ -z "$SSH_USER_NAME" ]     && SSH_USER_NAME=user
[ -z "$SSH_USER_PASSWD" ]   && SSH_USER_PASSWD=password
[ -z "$SSH_USER_HOME" ]     && SSH_USER_HOME=/home/user

echo "root:x:0:0:root:/root:/bin/bash" > /etc/passwd
echo "sshd:x:104:65534::/var/run/sshd:/usr/sbin/nologin" >> /etc/passwd
echo "root:x:0:root" > /etc/group
echo "nogroup:x:65534:" >> /etc/group

mkdir -p $SSH_USER_HOME/.ssh
chown -R $SSH_USER_UID:$SSH_USER_GID $SSH_USER_HOME

addgroup --system --gid $SSH_USER_GID $SSH_USER_GROUP
adduser --home $SSH_USER_HOME --system --uid $SSH_USER_UID --gid $SSH_USER_GID --shell /bin/bash $SSH_USER_NAME

echo "root:$SSH_ROOT_PASSWD" | chpasswd
echo "$SSH_USER_NAME:$SSH_USER_PASSWD" | chpasswd

find /mnt/ssh-keys -type f -exec cat {} \; > $SSH_USER_HOME/.ssh/authorized_keys

exec /usr/sbin/sshd -D