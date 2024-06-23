FROM alpine:3.19

WORKDIR /app

RUN apk add nginx --no-cache

RUN chown -RL 1001:0 /var/lib/nginx

USER 1001

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
