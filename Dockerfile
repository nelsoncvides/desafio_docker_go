FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build -ldflags '-s -w' hello-world.go

FROM scratch

WORKDIR /

COPY --from=builder /app / 

CMD ["./hello-world"]



