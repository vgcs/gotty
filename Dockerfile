FROM alpine:latest

EXPOSE 8080

RUN apk add --update go git && \
  mkdir -p /tmp/gotty && \
  GOPATH=/tmp/gotty go get github.com/vgcs/gotty && \
  mv /tmp/gotty/bin/gotty /usr/local/bin/ && \
  apk del go git && \
  rm -rf /tmp/gotty /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]