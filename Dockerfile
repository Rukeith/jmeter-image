FROM centos
USER root
RUN yum install -y epel-release && \
    yum install -y git curl git jq wget && \
    yum groupinstall 'Development Tools' -y

RUN cd /opt/ && \
    wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz" && \
    tar xzf jdk-8u161-linux-x64.tar.gz && \
    cd /opt/jdk1.8.0_161/ && \
    alternatives --install /usr/bin/java java /opt/jdk1.8.0_161/bin/java 2 && \
    alternatives --install /usr/bin/jar jar /opt/jdk1.8.0_161/bin/jar 2 && \
    alternatives --install /usr/bin/javac javac /opt/jdk1.8.0_161/bin/javac 2 && \
    alternatives --set jar /opt/jdk1.8.0_161/bin/jar && \
    alternatives --set javac /opt/jdk1.8.0_161/bin/javac

ENV JAVA_HOME=/opt/jdk1.8.0_161 \
    JRE_HOME=/opt/jdk1.8.0_161/jre \
    PATH=$PATH:/opt/jdk1.8.0_161/bin:/opt/jdk1.8.0_161/jre/bin

RUN wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.tgz && \
    tar -xf apache-jmeter-3.3.tgz