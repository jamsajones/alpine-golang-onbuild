
# WIP

## Details

Alpine based image for Golang.

## Usage example

```
echo "github.com/prometheus/graphite_exporter" > .godir
echo "0.1.0-test" > VERSION
cat > GOFLAGS <<-EOFILE
goFlags="-X main.buildVersion  $(cat VERSION) \
        -X main.buildRevision $(git rev-parse --short HEAD) \
        -X main.buildBranch   $(git rev-parse --abbrev-ref HEAD) \
        -X main.buildUser     root \
        -X main.buildDate     $(date +%Y%m%d-%H:%M:%S) \
        -X main.goVersion     $(go version | awk '{print substr($3,3)}')"
EOFILE
```

```
FROM sdurrheimer/alpine-golang-onbuild
MAINTAINER The Prometheus Authors <prometheus-developers@googlegroups.com>

EXPOSE  9108 9109
```
