FROM alpine:3.19 as build

RUN apk add openjdk11 && \
    apk add maven --no-cache

COPY ./spring-backend/pom.xml .

RUN mvn install

COPY ./spring-backend .

RUN mvn package

FROM alpine:3.19

WORKDIR /app

RUN apk add openjdk11 --no-cache

COPY --from=build ./target/hobbie-backend-0.0.1-SNAPSHOT.jar .

USER 1001

CMD ["java", "-jar", "./hobbie-backend-0.0.1-SNAPSHOT.jar"]
