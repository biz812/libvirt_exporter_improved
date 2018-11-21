rm -f libvirt_exporter
docker build -t libvirtexporterbuild -f Dockerbuildimage .
docker run --rm -v "$PWD/../../../":/go/src/ -w /go/src/github.com/rumanzo/libvirt_exporter -e GOOS=linux -e GOARCH=amd64 libvirtexporterbuild:latest go build --ldflags '-extldflags "-static"'