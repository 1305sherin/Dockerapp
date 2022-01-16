FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.56/bin/apache-tomcat-9.0.56.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.56/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
LABEL app=Dockerapp
COPY target/*.war /usr/local/tomcat/webapps/myweb.war
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
RUN cd /usr/local/tomcat/
RUN mv webapps webapps2
RUN mv webapps.dist/ webapps
RUN cp /usr/local/tomcat/webapps2/myweb.war . 

