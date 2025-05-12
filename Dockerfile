# Example Dockerfile
FROM golang:1.21 as builder
WORKDIR /app
COPY . .
RUN go build -o app .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
ENTRYPOINT ["./app"]