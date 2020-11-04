FROM alpine:3.12
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing mailutils
RUN apk add bash ssmtp util-linux --no-cache --update --upgrade
ADD ssmtp.conf  /etc/ssmtp/
ADD revaliases /etc/ssmtp/
ADD mail /etc/ssmtp/ 

