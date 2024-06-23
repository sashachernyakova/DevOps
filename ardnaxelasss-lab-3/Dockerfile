FROM alpine:3.19.1 as system

RUN apk update && \
    apk add openjdk17 maven && \
    rm -rf /var/cache/apk/*

FROM system as build

WORKDIR /build

COPY spring-petclinic/pom.xml .

RUN  mvn dependency:resolve

COPY spring-petclinic/src ./src

RUN mvn package &&\
    rm -rf /var/cache/apk/*

FROM system as run

WORKDIR /home

COPY --from=build /build/target/*.jar app.jar

RUN chown -R 1000:1000 /home  
 
USER 1000:1000

CMD ["java", "-jar", "app.jar"]
