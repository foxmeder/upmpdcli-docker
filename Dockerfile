FROM ubuntu:20.04

ENV TZ Asia/Shanghai
ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
    && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get install -y --no-install-recommends tzdata software-properties-common \
    && rm /etc/localtime \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \ 
    && add-apt-repository ppa:jean-francois-dockes/upnpp1 \
    && apt-get update && apt-get install -y upmpdcli \
    && apt-get clean -y

COPY run.sh /run.sh
ENTRYPOINT /run.sh
