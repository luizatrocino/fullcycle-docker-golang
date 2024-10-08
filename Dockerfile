FROM golang:alpine3.20 AS builder
WORKDIR /app
COPY . .
RUN go build -ldflags "-s -w" -o myapp main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/myapp .
ENTRYPOINT ["/app/myapp"]
