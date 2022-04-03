# 1 - Imagen necesaria para compilar Spring boot
FROM openjdk:8-jdk-alpine as build-step

WORKDIR /build/app

COPY mvnw .

COPY .mvn .mvn

COPY pom.xml .

COPY src src

RUN ./mvnw package -DskipTests

# 2 - Imagen necesaria para correr el jar
FROM openjdk:8-jdk-alpine

COPY --from=build-step /build/app/target/shippingapi-0.0.1-SNAPSHOT.jar /usr/share/app.jar

ENTRYPOINT ["/usr/bin/java", "-jar", "/usr/share/app.jar"]