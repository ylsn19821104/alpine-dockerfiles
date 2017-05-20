FROM ncc0706/alpine-sshd

MAINTAINER niuyuxian <"ncc0706@gmail.com">

WORKDIR /app

COPY supervisord.conf /etc/supervisord.conf

RUN apk --update add ca-certificates wget \  
	&& update-ca-certificates \
	&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz \
	&& ln -s /app/jdk1.8.0_131 /app/java \
	&& rm -rf jdk-8u131-linux-x64.tar.gz \
	&& rm -rf /var/cache/apk/* /tmp/*

ENV JAVA_HOME /app/java
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

ENTRYPOINT ["/usr/bin/supervisord"]









