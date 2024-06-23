FROM node:18-alpine as build

WORKDIR /app

RUN apk add npm --no-cache

COPY ./react-frontend/ .

RUN npm install && npm run build

FROM alpine:3.19

WORKDIR /app

RUN apk add nginx --no-cache && chown -RL 1001:0 /var/lib/nginx

COPY --from=build /app/build .

USER 1001

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
