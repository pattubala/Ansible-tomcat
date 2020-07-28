FROM centos

MAINTAINER Lokesh

RUN mkdir /opt/tomcat/
RUN yum install unzip -y
RUN yum install java-1.8.0-openjdk -y
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el8_2.x86_64/jre/
WORKDIR /opt/tomcat
RUN curl -O http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57.zip
RUN unzip apache-tomcat*
RUN mv apache-tomcat-8.5.57/* /opt/tomcat
WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080
RUN chmod -R +x /opt/tomcat/bin/
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
