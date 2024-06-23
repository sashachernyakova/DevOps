FROM alpine:3.19.1

RUN apk update && \
    apk add openjdk17 maven && \
    rm -rf /var/cache/apk/*

WORKDIR spring-petclinic

COPY spring-petclinic/pom.xml .

RUN  mvn dependency:resolve && \
    rm -rf /var/cache/apk/*

COPY spring-petclinic/src ./src

RUN mvn package \
    && mv target/*.jar app.jar && \
    rm -rf /var/cache/apk/*

RUN chown -R 1000:1000 /spring-petclinic   
 
USER 1000:1000

CMD ["java", "-jar", "app.jar"]