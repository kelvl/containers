FROM debian:stable-slim
LABEL maintainer="kelvl"

ENV PROVISION_VERSION="1.1.0"
ENV ALTSERVER_VERSION="v0.0.5"
ENV NETMUXD_VERSION="v0.1.4"
ENV JITTERBUGPAIR_VERSION="v1.3.1"
ENV ARCH="x86_64"

ENV LC_ALL="C.UTF-8" LANG="C.UTF-8" 
ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get -y update && apt-get install -y \
    wget \
    curl \
    unzip \
    libavahi-compat-libdnssd-dev \
    avahi-utils \
    libplist-utils \
    usbmuxd \ 
    usbutils \
    iproute2 \
    libimobiledevice-utils \
    python3

RUN sed -i 's/.*enable-dbus=.*/enable-dbus=no/' /etc/avahi/avahi-daemon.conf

WORKDIR /build

RUN wget https://github.com/Dadoum/Provision/releases/download/${PROVISION_VERSION}/anisette_server-x86_64 && \
    mv anisette_server-x86_64 /opt/anisette_server && \
    chmod +x /opt/anisette_server

RUN wget https://github.com/osy/Jitterbug/releases/download/${JITTERBUGPAIR_VERSION}/jitterbugpair-linux.zip && \
    unzip jitterbugpair-linux.zip && \
    mv jitterbugpair /opt/jitterbugpair && \
    rm jitterbugpair-linux.zip && \
    chmod +x /opt/jitterbugpair

RUN wget https://github.com/NyaMisty/AltServer-Linux/releases/download/${ALTSERVER_VERSION}/AltServer-x86_64 && \
    mv AltServer-x86_64 /opt/altserver && \
    chmod +x /opt/altserver

RUN wget https://github.com/jkcoxson/netmuxd/releases/download/${NETMUXD_VERSION}/x86_64-linux-netmuxd && \
    mv x86_64-linux-netmuxd /opt/netmuxd && \
    chmod +x /opt/netmuxd

RUN rm -rf /build

# Install s6
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.3.0/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz

ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.3.0/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

ADD s6-rc.d /etc/s6-overlay/s6-rc.d

ENTRYPOINT [ "/init" ]
