FROM golang:1.17-alpine3.15 AS builder

WORKDIR /app

COPY go.* ./

RUN go mod init fullcyclechallenger

COPY *.go ./

RUN go build -o /main

FROM scratch

WORKDIR /

COPY --from=builder /main /main

ENTRYPOINT ["/main"]