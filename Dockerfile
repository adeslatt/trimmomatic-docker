# Full contents of Dockerfile
FROM ubuntu
LABEL description="Base docker image with conda and util libraries - also need java"
ARG ENV_NAME="trimmomatic"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install wget && \
    apt-get -y install unzip && \
    apt-get -y install default-jre && \
    rm -rf /var/lib/apt/lists/*

# need to get, configure and make samtools to have this docker work
RUN wget https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip && \
    unzip Trimmomatic-0.39.zip


