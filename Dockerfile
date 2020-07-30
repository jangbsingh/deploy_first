FROM centos:7
MAINTAINER JBSINGH
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.36/bin/apache-tomcat-9.0.36.tar.gz
RUN tar xvfz apache-tomcat-9.0.36.tar.gz
RUN mv apache-tomcat-9.0.36/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
WORKDIR /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat9/bin/catalina.sh","run"]

