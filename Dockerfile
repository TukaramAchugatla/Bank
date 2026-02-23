FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY target/ProjectMaven-0.0.1-SNAPSHOT.jar Jenkins.app
EXPOSE 8080
ENTRYPOINT ["java","-jar","Jenkins.jar"]