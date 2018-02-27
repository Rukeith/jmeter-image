FROM alpine
ARG JMETER_VERSION="4.0"
ENV JMETER_HOME=/opt/apache-jmeter-${JMETER_VERSION} \
    JMETER_BIN=${JMETER_HOME}/bin \
    JMETER_DOWNLOAD_URL=http://mirrors.ocf.berkeley.edu/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz \
    TZ="Europe/Amsterdam"

RUN    apk update \
	&& apk upgrade \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add --update openjdk8-jre tzdata curl unzip bash \
	&& rm -rf /var/cache/apk/* \
	&& mkdir -p /tmp/dependencies  \
	&& curl -L --silent ${JMETER_DOWNLOAD_URL} > /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz \
	&& mkdir -p /opt \
	&& tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /opt \
	&& rm -rf /tmp/dependencies

ENV PATH $PATH:$JMETER_BIN
WORKDIR	${JMETER_HOME}