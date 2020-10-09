FROM docker.io/centos:7

LABEL maintainer = "Danielle Martin <danigpam@gmail.com>"

RUN yum update -y && \
    yum install -y java-11-openjdk unzip wget 

WORKDIR /opt

COPY [ "files/sonar.properties", "scripts/entrypoint.sh", "/" ]

RUN wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.9.4.zip && \
    unzip sonarqube-7.9.4.zip && \
    mv sonarqube-7.9.4 sonarqube && \
    useradd sonarqube && \
    chown -R sonarqube:sonarqube /opt /entrypoint.sh

USER sonarqube

EXPOSE 9000

ENTRYPOINT [ "sh", "/entrypoint.sh" ]