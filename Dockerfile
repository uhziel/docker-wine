FROM ubuntu:20.04

RUN set -eux; \
        sed -i~ 's/http:\/\/archive.ubuntu.com/http:\/\/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list; \
        apt-get update; \
        apt-get install -y \
            wget \
            software-properties-common \
            gnupg2 \
            winbind \
        ; \
        dpkg --add-architecture i386; \
        wget -nc https://dl.winehq.org/wine-builds/winehq.key; \
        apt-key add winehq.key; \
        add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'; \
        apt-get update; \
        apt install -y --install-recommends winehq-stable; \
        rm -rf /var/lib/apt/lists/*;
