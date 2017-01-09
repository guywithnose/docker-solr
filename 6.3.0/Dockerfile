FROM rafaelsoares/archlinux

RUN pacman-key --init && pacman-key --populate archlinux && pacman-key --refresh-keys && pacman --sync --refresh --noconfirm --noprogressbar --quiet && pacman --sync --refresh --sysupgrade --noconfirm --noprogressbar --quiet && pacman-db-upgrade && pacman --sync --noconfirm --noprogressbar --quiet jre8-openjdk-headless unzip lsof ca-certificates-java

ENV SOLR_VERSION 6.3.0
ENV SOLR solr-$SOLR_VERSION

RUN curl --retry 3 http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz | tar -C /opt --extract --gzip
RUN mv /opt/$SOLR /opt/solr

RUN useradd --home-dir /opt/solr --comment "Solr Server" solr

RUN mkdir -p /solr/apps/solr/home
RUN mkdir -p /opt/solr/server/logs
RUN mkdir -p /opt/solr/server/logs
RUN mkdir -p /opt/solr/logs

RUN chown -R solr:solr /opt/solr/example /opt/solr/server/logs /opt/solr/logs

RUN ln -s /opt/solr/dist/ /solr/apps/solr/home/

USER solr

EXPOSE 8983
WORKDIR /opt/solr

CMD ["bin/solr", "start", "-f"]
