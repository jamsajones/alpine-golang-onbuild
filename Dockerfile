FROM alpine:edge
MAINTAINER The Prometheus Authors <prometheus-developers@googlegroups.com>

ENV GOPATH /go
ENV PATH $PATH:$GOPATH/bin

RUN addgroup -S golang && adduser -S -G golang golang

COPY go-build /bin/go-build
COPY go-run /bin/go-run

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

ONBUILD COPY    . /go/src/app
ONBUILD RUN     /bin/go-build "$(cat VERSION)"
ONBUILD WORKDIR /bin
ONBUILD USER    golang

ENTRYPOINT  ["/bin/go-run"]
