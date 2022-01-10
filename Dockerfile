FROM golang:1.14.4
WORKDIR /app
ADD . .
RUN go build -o main .
CMD /app/main
