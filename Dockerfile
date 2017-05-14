# FROM armhfbuild/debian
FROM resin/rpi-raspbian
MAINTAINER Daniel Floris <daniel.floris@gmail.com>
# RUN lsb_release -a

RUN apt-get update && \
    apt-get install -y \
    curl

RUN curl http://www.linux-projects.org/listing/uv4l_repo/lrkey.asc | apt-key add -
RUN echo "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/ jessie main" > /etc/apt/sources.list.d/uv4l-wheezy.list

RUN apt-get update && \
    apt-get install -y \
    uv4l \
    uv4l-uvc \
    uv4l-server \
    uv4l-renderer \
    fuse

# Here the packages that we need in the future to add support to the raspicam
# uv4l-decoder uv4l-encoder uv4l-mjpegstream uv4l-raspicam uv4l-raspicam-extras uv4l-renderer

ADD uv4l-uvc.conf /etc/uv4l/uv4l-uvc.conf
