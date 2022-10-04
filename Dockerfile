FROM eclipse-temurin:8-jre-focal

LABEL maintainer="Brendan Coulson <brendan@headspacetech.com>"

RUN apt-get update && apt-get install -y sudo ant python && apt-get clean

ENV HOME /opt/play
ENV PLAY_VERSION 1.5.3
RUN groupadd -r play -g 1000 && \
    useradd -u 1000 -r -g play -m -d $HOME -s /sbin/nologin -c "Play user" play

WORKDIR $HOME

USER play
COPY ./play-1.5.3 /opt/play/play-1.5.3


USER root
RUN ln -sf $HOME/play-${PLAY_VERSION}/play /usr/local/bin
USER play

EXPOSE 9000