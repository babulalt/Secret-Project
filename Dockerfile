FROM golang:1.14-alpine3.12 AS builder

COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 go build ./cmd/server/main.go 

FROM alpine:3.12
RUN apk --update add ca-certificates && \
    rm -rf /var/cache/apk/*
RUN adduser -D usera
USER usera
COPY --from=builder /app /home/appuser/app
WORKDIR /home/appuser/app
EXPOSE 3000
CMD ["./main"]
