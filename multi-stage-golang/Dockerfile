FROM golang:1.13 AS builder
WORKDIR /root
COPY . /root
RUN GOOS=linux go build -o app .

# scratch は超軽量なイメージ。詳細はこちら →　https://hub.docker.com/_/scratch/
FROM scratch
WORKDIR /root
COPY --from=builder /root/app .
CMD ["./app"]