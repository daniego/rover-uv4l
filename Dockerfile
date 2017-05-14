# FROM armhfbuild/debian
FROM resin/rpi-raspbian
MAINTAINER Daniel Floris <daniel.floris@gmail.com>
# RUN lsb_release -a

RUN apt-get update && \
    apt-get install -y \
    curl

RUN    curl http://www.linux-projects.org/listing/uv4l_repo/lrkey.asc | apt-key add -

RUN echo "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/ jessie main" > /etc/apt/sources.list.d/uv4l-wheezy.list
# RUN deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/ jessie main
# RUN echo "deb http://www.linux-projects.org/listing/uv4l_repo/raspbian/ wheezy main" > /etc/apt/sources.list.d/uv4l-wheezy.list

RUN apt-get update
RUN apt-get install -y uv4l
RUN apt-get install -y uv4l-uvc
RUN apt-get install -y libmtp-runtime
# RUN apt-get install --reinstall linux-image-3.2.0
RUN apt-get install -y uv4l-xscreen
RUN apt-get install -y uv4l-mjpegstream
# RUN apt-get install -y raspberrypi-kernel-headers
# RUN apt-get install -y build-essential
RUN apt-get install -y uv4l-server
RUN apt-get install -y uv4l-renderer
RUN apt-get install -y fuse
#uv4l uv4l-decoder uv4l-encoder uv4l-mjpegstream uv4l-raspicam uv4l-raspicam-extras uv4l-renderer uv4l-server uv4l-uvc uv4l-webrtc uv4l-xscreen

# dev tools
RUN apt-get install -y usbutils rsyslog

RUN apt-get install -y libraspberrypi0
RUN apt-get install -y uv4l-raspicam uv4l-raspicam-extras
ADD uv4l-uvc.conf /etc/uv4l/uv4l-uvc.conf
