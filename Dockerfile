# Dockerfile
FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    openjdk-11-jdk \
    maven \
    curl && \
    rm -rf /var/lib/apt/lists/*

# Copy the application code
COPY . /app

# Set the working directory
WORKDIR /app

# Build the application with debug output
RUN mvn clean install -X

# Expose port 80
EXPOSE 80

# Start the application
CMD ["java", "-jar", "target/devops-build-1.0.jar"]


























