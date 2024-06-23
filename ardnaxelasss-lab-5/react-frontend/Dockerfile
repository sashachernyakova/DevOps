FROM alpine:3.18.6 as builder
RUN apk update \
    && apk add npm\
    && rm -rf /var/cache/apk/*

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY ./ ./

RUN ["npm", "run", "build"]

FROM alpine:3.18.6 as system

RUN apk update \
    && apk add nginx\
    && rm -rf /var/cache/apk/*

RUN mkdir -p /run/nginx \
    && chown -R 2000:2000 /run /var/log/nginx /var/lib/nginx

COPY --from=builder /app/build /usr/share/nginx/html

USER 2000

CMD ["nginx", "-g", "daemon off;"]
