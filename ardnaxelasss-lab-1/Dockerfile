FROM alpine:3.14

RUN apk update && \
    apk add nginx --no-cache

RUN chown -R 1000:1000 /var/lib/nginx /var/log/nginx /run/nginx

USER 1000:1000

CMD ["nginx", "-g", "daemon off;"]
