FROM debian:bookworm

WORKDIR /srv/test

RUN apt-get update && apt-get install -y procps net-tools iputils-ping nano curl nginx && \
    rm -rf /var/lib/apt/lists/*

COPY cert.pem /etc/nginx/certs/cert.pem
COPY key.pem /etc/nginx/certs/key.pem

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
