# Start from bionics
FROM ubuntu:bionic

WORKDIR /srv/mkdocs

# Install xvfb for drawio
RUN apt-get update ; apt-get install -y bash xvfb libasound2 python3.8 python3-pip git wget

COPY ./requirements.txt /srv/mkdocs

RUN cd /tmp ; wget https://github.com/jgraph/drawio-desktop/releases/download/v13.7.9/draw.io-amd64-13.7.9.deb; apt-get install -y ./draw.io-amd64-13.7.9.deb libgbm1

RUN cd /srv/mkdocs ; python3.8 -m pip install -r requirements.txt
