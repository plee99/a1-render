FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean install -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build /target/a1_histogram-0.0.1-SNAPSHOT.jar a1_histogram.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "a1_histogram.jar"]