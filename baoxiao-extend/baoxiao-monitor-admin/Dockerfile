FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER Lion Li

RUN mkdir -p /baoxiao/monitor/logs

WORKDIR /baoxiao/monitor

EXPOSE 9090

ADD ./target/baoxiao-monitor-admin.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
