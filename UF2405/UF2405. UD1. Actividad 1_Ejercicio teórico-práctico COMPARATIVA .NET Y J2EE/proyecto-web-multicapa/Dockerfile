# Etapa 1: Compilar el código Java usando Maven
FROM maven:3.8-openjdk-11 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests -q

# Etapa 2: Ejecutar en Tomcat
FROM tomcat:9-jdk11
# Copiamos el .war compilado a la carpeta de despliegue de Tomcat
COPY --from=builder /app/target/proyecto-web-multicapa.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]