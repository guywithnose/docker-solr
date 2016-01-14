FROM base/archlinux

RUN pacman-key --populate archlinux && pacman-key --refresh-keys && pacman --sync --refresh --noconfirm --noprogressbar --quiet && pacman --sync --refresh --sysupgrade --noconfirm --noprogressbar --quiet && pacman-db-upgrade && pacman --sync --noconfirm --noprogressbar --quiet jre7-openjdk-headless unzip lsof ca-certificates-java

ENV SOLR_VERSION 4.6.1
ENV SOLR solr-$SOLR_VERSION

RUN curl --retry 3 http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz | tar -C /opt --extract --gzip
RUN mv /opt/$SOLR /opt/solr

RUN useradd --home-dir /opt/solr --comment "Solr Server" solr

RUN chown -R solr:solr /opt/solr/example

RUN mkdir -p /solr/apps/solr/home

RUN ln -s /opt/solr/dist/ /solr/apps/solr/home/

USER solr

EXPOSE 8983
WORKDIR /opt/solr/example

CMD ["java", "-jar", "start.jar"]
