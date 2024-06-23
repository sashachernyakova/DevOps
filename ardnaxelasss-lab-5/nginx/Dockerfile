FROM alpine:3.18

RUN apk update && \
    apk add nginx && \
    rm -rf /var/cache/apk/*

RUN chown 2000:2000 -R /var/lib/nginx /var/log/nginx /run/nginx
    
USER 2000


CMD ["nginx", "-g", "daemon off;"]
