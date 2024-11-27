FROM debian:bookworm

WORKDIR /srv/test

COPY test-bin/test /srv/test
COPY test-script/monitor.sh /srv/test/test-script/monitor.sh
COPY test-script/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get update && \
    apt-get install -y procps net-tools iputils-ping nano curl supervisor && \
    chmod +x /srv/test/test-script/monitor.sh

CMD ["supervisord", "-n"]
