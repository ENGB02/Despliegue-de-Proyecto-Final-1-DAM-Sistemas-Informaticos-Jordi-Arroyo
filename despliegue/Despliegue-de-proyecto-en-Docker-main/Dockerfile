FROM tomcat:latest

LABEL maintainer="zhijunlin"

ADD ./target/demo.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
