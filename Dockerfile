# Stage 1: Build the application
FROM gradle:8.11.1-jdk21-corretto AS builder
WORKDIR /app
COPY gradle ./gradle
COPY build.gradle settings.gradle gradlew ./
COPY src ./src
RUN gradle clean build -x test

# Stage 2: Run the application
FROM amazoncorretto:21.0.3-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
