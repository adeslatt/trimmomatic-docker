# Full contents of Dockerfile
FROM ubuntu
LABEL description="Base docker image for trimmomatic -- also needs java"
ARG ENV_NAME="trimmomatic"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install wget && \
    apt-get -y install unzip && \
    apt-get -y install default-jdk && \ 
    rm -rf /var/lib/apt/lists/*

# need to put the jar file in the directory java can find it - so we know jva is installed in /usr/bin
# download and unpack Trimmomatic-0.39.zip in /usr/bin and then make symbolic links to the jar file and
# adapter files where they may be found.
RUN cd /usr/bin && \
    wget https://github.com/usadellab/Trimmomatic/files/5854859/Trimmomatic-0.39.zip && \
    unzip Trimmomatic-0.39.zip && \
    ln -s Trimmomatic-0.39/trimmomatic-0.39.jar . && \
    ln -s Trimmomatic-0.39/adapters/*.fa .



