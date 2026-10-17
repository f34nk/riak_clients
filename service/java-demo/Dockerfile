FROM maven:3.9-eclipse-temurin-21-alpine AS build

WORKDIR /app

COPY target/java /deps/openriak
RUN cd /deps/openriak \
    && mvn -q -Drevision="$(cat VERSION)" -DskipTests install

COPY service/java-demo/pom.xml .
COPY service/java-demo/src src/
RUN VERSION="$(cat /deps/openriak/VERSION)" \
    && mvn -q -Dopenriak.version="$VERSION" -DskipTests package

FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=build /app/target/app.jar ./app.jar

# Small heap and minimal JIT/GC for faster JVM startup in a short-lived demo container.
ENV JAVA_TOOL_OPTIONS="-XX:+UseContainerSupport -Xms32m -Xmx128m -XX:TieredStopAtLevel=1 -XX:+UseSerialGC"

CMD ["java", "-jar", "app.jar"]
