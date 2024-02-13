FROM openjdk:22-bullseye

EXPOSE 8888

# copy jar into image
COPY target/spring-petclinic-3.2.0-SNAPSHOT.jar /usr/bin/spring-petclinic-christophl.jar

# run application with this command line 
ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic-christophl.jar","--server.port=8888"]