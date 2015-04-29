
# WIP

## Details

Alpine edge based image for Golang 1.4.2.

## Usage example

```
echo "github.com/prometheus/graphite_exporter" > .godir
echo "0.1.0-test" > VERSION
```

```
FROM sdurrheimer/alpine-golang-onbuild
MAINTAINER The Prometheus Authors <prometheus-developers@googlegroups.com>

EXPOSE  9108 9109
CMD     [ "-logtostderr" ]
```
