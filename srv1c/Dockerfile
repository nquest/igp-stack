FROM debian:stable
# FROM debian:stable-20221114-slim
RUN apt-get -qq update \
  && apt-get -qq install --yes --no-install-recommends ca-certificates wget locales procps \
  && `#----- Install the dependencies -----` \
  && apt-get -qq install --yes --no-install-recommends fontconfig imagemagick \
  && `#----- Deal with ttf-mscorefonts-installer -----` \
  && apt-get -qq install --yes --no-install-recommends xfonts-utils cabextract \
  && `#----- Deal with 1c Dependences -----` \
  && apt-get -qq install --yes --no-install-recommends aspell aspell-en dictionaries-common emacsen-common \
hunspell-en-us libaspell15 libgpm2 libhunspell-1.7-0 libncursesw6 libtext-iconv-perl \
  && apt-get clean && apt-get autoremove

RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8

ENV LANG ru_RU.utf8
ENV SERVER_VERSION 8.3.22.1704

ADD ./distr/* /tmp/distr/
RUN dpkg --install /tmp/distr/ttf-mscorefonts-installer_3.8_all.deb 2> /dev/null \
  && dpkg --install /tmp/distr/libenchant1c2a_1.6.0-11.1+b1_amd64.deb 2> /dev/null \
  && /tmp/distr/setup-full-${SERVER_VERSION}-x86_64.run --mode unattended --enable-components server,ws \
  && ln -s /opt/1cv8/x86_64/${SERVER_VERSION}/srv1cv83.conf /etc/default/ \
  && ln -s /opt/1cv8/x86_64/${SERVER_VERSION}/srv1cv83 /etc/init.d/srv1cv83 \
  && rm /tmp/distr/* 

ENTRYPOINT /opt/1cv8/x86_64/${SERVER_VERSION}/ragent

EXPOSE 1540-1541 1560-1591

VOLUME /home/usr1cv8
VOLUME /var/log/1C

CMD ["ragent"]


