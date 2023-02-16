FROM debian:11-slim

ARG S6_OVERLAY_VERSION=3.1.2.1

RUN sed -r -i 's/^deb(.*)$/deb\1 contrib/g' /etc/apt/sources.list
RUN apt-get -qq update \
  && apt-get -qq install --yes --no-install-recommends \
    ca-certificates \
    wget \
    locales \
    procps \
    fontconfig \
    imagemagick \
    cabextract \
    ttf-mscorefonts-installer \
    xz-utils \
  && apt-get clean && apt-get autoremove


# S6 overlay start
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
ENTRYPOINT ["/init"]
# S6 ocerlay end

# explicitly set user/group IDs
RUN set -eux; \
	groupadd -r usr1cv8 --gid=999; \
	useradd -m -r -g usr1cv8 --uid=999 --home-dir=/home/usr1cv8 --shell=/bin/bash usr1cv8; 
	
RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8

ENV LANG ru_RU.utf8
ENV SERVER_VERSION 8.3.22.1750
ENV SERVER_DATA /home/usr1cv8
ADD ./distr/* /tmp/distr/
RUN  /tmp/distr/setup-full-${SERVER_VERSION}-x86_64.run  \
      --mode unattended \
      --enable-components server,ru,server_admin \
      --disable-components client_full \
  && rm /tmp/distr/* 

# s6 scripts
COPY ./services.d /etc/services.d 

EXPOSE 1540-1541 1545 1560-1591

VOLUME /home/usr1cv8
VOLUME /var/1C


# CMD ["sh", "-c", "/opt/1cv8/x86_64/${SERVER_VERSION}/ragent"]

# -d ${SRV1CV8_DATA} \
# -port ${SRV1CV8_PORT} \
# -regport ${SRV1CV8_REGPORT} \
# -range ${SRV1CV8_RANGE} \
# -seclev ${SRV1CV8_SECLEV} \
# -pingPeriod ${SRV1CV8_PINGPERIOD} \
# -pingTimeout ${SRV1CV8_PINGTIMEOUT} \
# $SRV1CV8_DEBUG



