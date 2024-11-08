# Use OpenJDK 11 as the base image
FROM maven:3.8-openjdk-11-slim as build

# Set working directory
WORKDIR /app

# Copy the source code
COPY src src
COPY pom.xml .

# Build the application
RUN mvn clean package -DskipTests

# Create the runtime image
FROM openjdk:11-jdk-slim

WORKDIR /app

# Copy the built artifact from the build stage
COPY --from=build /app/target/cardatabase-0.0.1-SNAPSHOT.jar app.jar

# Set the startup command to execute the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
