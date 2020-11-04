To create a docker image with ssmtp server :
docker build . -f Dockerfile -t ssmtp_alpine:latest

and for run

docker run -it --rm --network=host ssmtp_alpine:latest bash

To compose and send an email, use the following command in the terminal:
ssmtp mail-receiver@example.com < mail-example
