# syntax=docker/dockerfile:1

FROM golang:alpine

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /usr/local/bin/wirestat

EXPOSE 8930

CMD ["/usr/local/bin/wirestat"]