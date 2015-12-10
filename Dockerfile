FROM hypriot/rpi-alpine-scratch
MAINTAINER Alexander Puzynia <werwolf.by@gmail.com>

COPY ./gogs /gogsit

RUN apk update && \
    apk add git bash && \
    adduser -H -D -g 'Gogs Git User' git -h /data/db/ -s /bin/bash && passwd -u git && \
    chown -R git:git /gogsit

WORKDIR /gogsit

CMD ["su", "-c", "./gogs web", "-s", "/bin/sh", "git"]
