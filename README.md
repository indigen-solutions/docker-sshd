# indigen/docker-sshd

This image based on debian:8 embed a simple ssh server

### Default account
  - root / random generated string
  - user / password
  
### Environment variables
  - **SSH_USER_UID:** If set change the ssh user uid. *(Default: 1000)*
  - **SSH_USER_GID:** If set change the ssh user gid. *(Default: 1000)*
  - **SSH_USER_GROUP:** If set change the ssh user group name. *(Default: users)*
  - **SSH_USER_NAME:** If set change the ssh user name *(Default: user)*
  - **SSH_USER_PASSWD:** If set change the ssh user password. *(Default: password)*
  - **SSH_USER_HOME:** If set change the ssh user home directory. *(Default: home)*
  - **SSH_ROOT_PASSWD:** If set change the root password. *(Default: random generated string)*

## SSH keys
All ssh keys files added to /mnt/ssh-keys will be added to the user authorized_keys file

### Docker-compose example
```yaml
version: '2'
services:
  sshd:
    image: indigen/sshd:latest
    environment:
      - SSH_USER_UID=1000
      - SSH_USER_NAME=indigen
      - SSH_USER_PASSWD=PassWord
    expose:
      - 22
```