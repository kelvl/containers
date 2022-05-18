FROM ubuntu:20.04
LABEL maintainer="kelvl"

# Set environment variables for your scanner
ENV SCANNER_NAME="MFC-L2700DW"
ENV SCANNER_MODEL="MFC-L2700DW"
ENV SCANNER_IP_ADDRESS="192.168.1.200"
ENV TZ="America/Los_Angeles"

ENV LC_ALL="C.UTF-8" LANG="C.UTF-8" 
ENV DEBIAN_FRONTEND="noninteractive"

# Debug mode
ENV INTR="true"

RUN apt-get -y update && apt-get install -y \ 
	sane \
	sane-utils \
	libusb-0.1 \
	libtiff-tools \
	gettext \
	pdftk \
	&& apt-get -y clean && rm -rf /var/lib/apt/lists/*

COPY drivers /opt/brother/docker_skey/drivers
RUN dpkg -i /opt/brother/docker_skey/drivers/*.deb

COPY scripts /opt/brother/docker_skey/scripts

COPY config /opt/brother/docker_skey/config

RUN ln -sfn /opt/brother/docker_skey/config/brscan_mail.config /etc/opt/brother/scanner/brscan-skey/brscan_mail.config && \
	ln -sfn /opt/brother/docker_skey/config/scantoemail.config /etc/opt/brother/scanner/brscan-skey/scantoemail.config && \
	ln -sfn /opt/brother/docker_skey/config/scantofile.config /etc/opt/brother/scanner/brscan-skey/scantofile.config && \
	ln -sfn /opt/brother/docker_skey/config/scantoimage.config /etc/opt/brother/scanner/brscan-skey/scantoimage.config && \
	ln -sfn /opt/brother/docker_skey/config/scantoocr.config /etc/opt/brother/scanner/brscan-skey/scantoocr.config

RUN ln -sfn /opt/brother/docker_skey/config/brscan_mail.config /opt/brother/scanner/brscan-skey/brscan_mail.config && \
	ln -sfn /opt/brother/docker_skey/config/scantoemail.config /opt/brother/scanner/brscan-skey/scantoemail.config && \
	ln -sfn /opt/brother/docker_skey/config/scantofile.config /opt/brother/scanner/brscan-skey/scantofile.config && \
	ln -sfn /opt/brother/docker_skey/config/scantoimage.config /opt/brother/scanner/brscan-skey/scantoimage.config && \
	ln -sfn /opt/brother/docker_skey/config/scantoocr.config /opt/brother/scanner/brscan-skey/scantoocr.config

RUN mkdir -p /scans

CMD /opt/brother/docker_skey/scripts/start.sh
