FROM base/archlinux

RUN pacman --sync --refresh --noconfirm --noprogressbar --quiet && pacman --sync --noconfirm --noprogressbar --quiet jdk7-openjdk

ENV SOLR_VERSION 1.1
ENV SOLR apache-solr-$SOLR_VERSION.0-incubating

RUN curl --retry 3 http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz | tar -C /opt --extract --gzip
RUN mv /opt/$SOLR /opt/solr

RUN useradd --home-dir /opt/solr --comment "Solr Server" solr

RUN chown -R solr:solr /opt/solr/example

USER solr

EXPOSE 8983
WORKDIR /opt/solr/example

CMD ["java", "-jar", "start.jar"]
