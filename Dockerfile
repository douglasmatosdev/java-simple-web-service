FROM maven:3.8.3-openjdk-17 as build
WORKDIR /app
COPY . .
RUN mvn clean package -X -DskipTests

FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]