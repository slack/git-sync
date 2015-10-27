SHORT_NAME ?= git-sync
VERSION ?= latest
REGISTRY ?= quay.io/jhansen
IMAGE := ${REGISTRY}/${SHORT_NAME}:${VERSION}

export GOARCH ?= amd64
export GOOS ?= linux
export CGO_ENABLED=0

BINDIR := rootfs/bin
LDFLAGS := "-s"

.PHONY: info all clean build docker-build push
all: info clean build docker-build push clean
	echo "Done! ${IMAGE}:${VERSION}"

clean:
	rm -f ${BINDIR}/git-sync

build: clean
	go build -o ${BINDIR}/git-sync -a -installsuffix cgo -ldflags ${LDFLAGS} main.go

docker-build:
	docker build --rm -t ${IMAGE} rootfs

info:
	@echo "Docker: REGISTRY=${REGISTRY} VERSION=${VERSION} IMAGE=${IMAGE}"
	@echo "Environment: BINDIR=${BINDIR}"
	@echo "Go Environment: GOOS=${GOOS} GOARCH=${GOARCH} CGO_ENABLED=${CGO_ENABLED} LDFLAGS=${LDFLAGS}"

push:
	docker push ${IMAGE}
