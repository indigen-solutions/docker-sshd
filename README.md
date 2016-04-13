# indigen/docker-sshd

This image based on debian:8 embed a simple ssh server

### Default account
  - root / root
  - user / user
  
### Environment variables
  - **SSH_USER_UID:** If set change the ssh user uid. *(Default: 1000)*
  - **SSH_USER_GID:** If set change the ssh user gid. *(Default: 1000)*
  - **SSH_USER_GROUP:** If set change the ssh user group name. *(Default: users)*
  - **SSH_USER_NAME:** If set change the ssh user name *(Default: user)*
  - **SSH_USER_PASSWD:** If set change the ssh user password. *(Default: password)*
  - **SSH_USER_HOME:** If set change the ssh user home directory. *(Default: home)*
  - **SSH_ROOT_PASSWD:** If set change the root password. *(Default: root)*