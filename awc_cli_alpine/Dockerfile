# AWS CLI V1 が使用できる最小のイメージ
FROM alpine:latest

# AWS CLI V1 は apk の edge/community repository にある。
# edge/community repository を参照先に登録する設定を追記
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache aws-cli