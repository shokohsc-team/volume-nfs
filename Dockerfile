FROM alpine:latest

RUN apk add --no-cache --update nfs-utils

ADD run_nfs.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/run_nfs.sh"]

EXPOSE 2049/tcp
