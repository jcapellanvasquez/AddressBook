# 1 - Imagen necesaria para compilar Spring boot
FROM openjdk:11 as addressbook-build-step

WORKDIR /build/app

COPY mvnw .

COPY .mvn .mvn

COPY pom.xml .

COPY src src

RUN ./mvnw clean install -DskipTests

# 2 - Imagen necesaria para correr el jar.
FROM openjdk:11


COPY --from=addressbook-build-step /build/app/target/addcressBook-0.0.1-SNAPSHOT.jar /app/app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]