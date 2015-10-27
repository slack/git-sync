FROM alpine:3.2
MAINTAINER Jason Hansen <jhansen@deis.com>

RUN apk update && \
    apk upgrade && \
    apk add git && \
    rm -rf /var/cache/apk/*

VOLUME ["/git"]
ENV GIT_SYNC_DEST /git

COPY . /

CMD ["/bin/git-sync"]
