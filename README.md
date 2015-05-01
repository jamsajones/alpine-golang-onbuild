
# WIP

## Details

Alpine edge based image for Golang 1.4.2.

## Usage example

```
echo "github.com/prometheus/graphite_exporter" > .godir
echo "0.1.0-test" > VERSION
cat > .goflags <<-EOFILE
goFlags="-X main.buildVersion  $(cat VERSION) \
-X main.buildRevision $(git rev-parse --short HEAD) \
-X main.buildBranch   $(git rev-parse --abbrev-ref HEAD) \
-X main.buildUser     root \
-X main.buildDate     $(date +%Y%m%d-%H:%M:%S) \
-X main.goVersion     $(go version | awk '{print substr($3,3)}')"
EOFILE
```
or in your `Makefile`
```
VERSION := 0.1.0-test
TARGET := graphite_exporter
GOFLAGS := "-X main.buildVersion  $(cat VERSION) \
	-X main.buildRevision $(git rev-parse --short HEAD) \
	-X main.buildBranch   $(git rev-parse --abbrev-ref HEAD) \
	-X main.buildUser     root \
	-X main.buildDate     $(date +%Y%m%d-%H:%M:%S) \
	-X main.goVersion     $(go version | awk '{print substr($3,3)}')"
```

### Dockerfile
```
FROM sdurrheimer/alpine-golang-onbuild
MAINTAINER The Prometheus Authors <prometheus-developers@googlegroups.com>

EXPOSE  9108 9109
CMD     [ "-logtostderr" ]
```
