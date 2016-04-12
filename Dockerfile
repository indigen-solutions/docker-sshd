FROM debian:8
MAINTAINER Jérôme Quéré <jerome.quere@indigen.com>

RUN apt-get update && apt-get install -y openssh-server emacs-nox
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config

RUN addgroup --system --gid 1000 user                               && \
    adduser  --system --uid 1000 --gid 1000 --shell /bin/bash user  && \
    echo 'user:user' | chpasswd

COPY ./start.sh /usr/local/bin/start.sh

EXPOSE 22
CMD ["start.sh"]