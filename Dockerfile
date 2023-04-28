FROM ubuntu:latest

RUN apt-get update && apt-get install -y curl

COPY script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

CMD while true; do /usr/local/bin/script.sh; sleep 600; done
