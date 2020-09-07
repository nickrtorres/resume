FROM ubuntu:latest

RUN mkdir /opt/texlive

COPY etc/install-tex.sh /opt/texlive
COPY etc/texlive.profile /opt/texlive/

RUN apt update -y && apt upgrade -y && apt update -y
RUN apt install -y cpanminus \
                   make      \
                   wget

ENV PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
RUN chmod +x /opt/texlive/install-tex.sh && /opt/texlive/install-tex.sh
