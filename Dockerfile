FROM maven:3.6-jdk-11 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Create a minimal JRE image
FROM adoptopenjdk/openjdk11:jre-11.0.11_9-alpine
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]