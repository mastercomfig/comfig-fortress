FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386
run echo "deb [trusted=yes] https://apt.fury.io/caddy/ /" \
        | sudo tee -a /etc/apt/sources.list.d/caddy-fury.list
RUN apt-get update
RUN echo steam steam/question select "I AGREE" | sudo debconf-set-selections
RUN echo steam steam/license note '' | sudo debconf-set-selections
RUN apt-get -yq --no-install-recommends install lib32z1 libncurses5:i386 libbz2-1.0:i386 lib32gcc1 lib32stdc++6 libtinfo5:i386 libcurl3-gnutls:i386 steamcmd caddy
RUN ./update.sh
RUN ln -s ~/.steam/steamcmd/linux32 ~/.steam/sdk32
CMD ["/bin/sh", "-c", "./tf2/start.sh"]
