# Start from bionics
FROM ubuntu:bionic

ARG DRAWIO_VERSION="14.6.13"
WORKDIR /srv/mkdocs

# Install xvfb for drawio
RUN apt-get update ; apt-get install -y bash xvfb libasound2 python3.8 python3-pip git wget
RUN wget -P /tmp https://github.com/jgraph/drawio-desktop/releases/download/v$DRAWIO_VERSION/drawio-amd64-$DRAWIO_VERSION.deb; apt-get install -y /tmp/drawio-amd64-$DRAWIO_VERSION.deb libgbm1

COPY files/requirements.txt /srv/mkdocs
COPY files/app.sh /app.sh

RUN cd /srv/mkdocs ; python3.8 -m pip install -r requirements.txt ; chmod 755 /app.sh

CMD ["/app.sh" ]
