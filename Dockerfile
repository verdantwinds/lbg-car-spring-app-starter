# Use OpenJDK 11 as the base image
FROM openjdk:11-jdk-slim

# Set working directory
WORKDIR /app

# Copy maven executable to the image
COPY mvnw .
COPY .mvn .mvn

# Copy the pom.xml file
COPY pom.xml .

# Copy the project source
COPY src src

# Package the application
RUN ./mvnw package -DskipTests

# Set the startup command to execute the jar
ENTRYPOINT ["java", "-jar", "/app/target/cardatabase-0.0.1-SNAPSHOT.jar"]
