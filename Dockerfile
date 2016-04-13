FROM debian:8
MAINTAINER Jérôme Quéré <jerome.quere@indigen.com>

RUN apt-get update && apt-get install -y openssh-server emacs-nox
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config
COPY ./start.sh /usr/local/bin/start.sh

EXPOSE 22
CMD ["start.sh"]