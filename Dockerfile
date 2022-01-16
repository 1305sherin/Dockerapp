FROM tomcat:9
LABEL app=Dockerapp
COPY target/*.war /usr/local/tomcat/webapps/myweb.war
CMD ["catalina.sh", "run"]

