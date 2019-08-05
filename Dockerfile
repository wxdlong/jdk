from golang:alpine as builder

RUN apk add --no-cache git build-base
ENV GO111MODULE on

RUN mkdir -p /go/src/github.com/gohugoio && \
    cd /go/src/github.com/gohugoio && \
    git clone https://github.com/gohugoio/hugo.git && \
    cd hugo && \
    go install -v -ldflags '-linkmode external -extldflags -static -s -w' -tags extended

RUN ls -lth /go/bin

RUN ldd /go/bin/hugo || echo hello 

from scratch

COPY --from=builder /go/bin/hugo /hugo

WORKDIR /code
CMD ["/hugo"]
