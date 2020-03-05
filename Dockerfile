# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Add Maintainer Info
#LABEL maintainer="krogot88@yandex.ru"

# Add a volume pointing to /tmp
#VOLUME /tmp

# Make port 8080 available to the world outside this container
#EXPOSE 8080

# Add the application's jar to the container
#ADD target/.jar app.jar

# Run the jar file
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

#ARG JAR_FILE
#ADD ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]


FROM openjdk:8-jre-alpine
ENV APP_ROOT /app
RUN mkdir ${APP_ROOT}
WORKDIR ${APP_ROOT}
COPY target/*.jar ${APP_ROOT}/run.jar
# EXPOSE 8080
ENTRYPOINT ["java", "-jar", "run.jar"]