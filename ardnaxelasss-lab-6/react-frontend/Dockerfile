FROM alpine:3.18

RUN apk update \
    && apk add npm\
    && rm -rf /var/cache/apk/*


WORKDIR /app


COPY . .

RUN npm install

RUN chown -R 2000:2000 .

USER 2000


CMD ["npm", "run", "start"]
