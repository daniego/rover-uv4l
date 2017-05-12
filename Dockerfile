FROM armv7/armhf-ubuntu:16.04
MAINTAINER Daniel Floris <daniel.floris@gmail.com>

RUN apt-get update && \
    apt-get install -y \
    tar \
    wget \
    gdebi-core

RUN    wget http://www.linux-projects.org/listing/uv4l_repo/uv4l_amd64-20161029.tar.gz
RUN  tar xvzf ./uv4l_amd64-20161029.tar.gz

WORKDIR uv4l_amd64-20161029

RUN gdebi ./libfuse3_2.9.3_amd64.deb

RUN gdebi ./uv4l_1.9.12_amd64.deb

RUN gdebi ./uv4l-uvc_1.8_amd64.deb

RUN gdebi ./uv4l-mjpegstream_1.4_amd64.deb

RUN  gdebi ./uv4l-xscreen_1.3_amd64.deb

RUN  gdebi ./uv4l-server_1.1.79_amd64.deb

RUN  gdebi ./uv4l-webrtc_1.59_amd64.deb

# ADD uv4l-uvc.conf /etc/uv4l/uv4l-uvc.conf
