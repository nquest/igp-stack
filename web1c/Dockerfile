FROM debian:11-slim

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
    apache2 \
  && apt-get clean && apt-get autoremove


# S6 overlay start
# ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz /tmp
# RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
# ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_OVERLAY_VERSION}/s6-overlay-x86_64.tar.xz /tmp
# RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz
# ENTRYPOINT ["/init"]

# S6 ocerlay end
RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8

ENV LANG ru_RU.utf8
ENV SERVER_VERSION 8.3.22.1750

ADD ./distr/* /tmp/distr/
RUN  /tmp/distr/setup-full-${SERVER_VERSION}-x86_64.run  \
      --mode unattended \
      --enable-components ws,ru \
      --disable-components client_full \
  && rm /tmp/distr/* 

RUN mkdir -p /var/run/apache2
COPY httpd-foreground /usr/local/bin/
RUN echo "LoadModule _1cws_module /opt/1cv8/x86_64/${SERVER_VERSION}/wsap24.so" > /etc/apache2/mods-enabled/wsap24.load
RUN echo "IncludeOptional /var/www/bases/*.conf" > /etc/apache2/conf-enabled/bases.conf
EXPOSE 80
VOLUME /var/www/

#ENTRYPOINT ["/usr/local/bin/httpd-foreground"]
CMD ["/usr/local/bin/httpd-foreground"]
