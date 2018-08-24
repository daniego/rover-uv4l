# rover-uv4l

This is an experimental container running [uv4l](http://www.linux-projects.org/) based on an ARMv7 container

NOTE!!!
The camera MUST be set in streming mode before stating the container, because its device-id changes
You will get the stream at http://<IP>:8080/stream/video.mjpeg

By default the container starts running `/usr/bin/uv4l --help`. To override the help option you need just to add the environment variable UV4L_PARAMETERS to your docker command.

Also you need to specify the USB device to map in the container.
In this expample I'm mapping my Ricoh Thesa S
``docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -e UV4L_PARAMETERS="-k -f --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 --auto-video_nr" daniego/rover-uv4l``

To run it with raspicam

``docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -e UV4L_PARAMETERS="--driver raspicam --auto-video_nr --width 640 --height 480 --encoding jpeg" daniego/rover-uv4l``



docker run -it -p 8080:8080 --device=/dev/vcsm --device=/dev/vchiq --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev --entrypoint="bash" daniego/rover-uv4l


docker run -it -p 8080:8080 --device=/dev/vcsm --device=/dev/vchiq --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -e UV4L_PARAMETERS="--driver raspicam --auto-video_nr --width 640 --height 480 --encoding jpeg" daniego/rover-uv4l

docker run -it -p 8080:8080 --device=/dev/vcsm --device=/dev/vchiq --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -e UV4L_PARAMETERS="--driver raspicam --auto-video_nr --width 640 --height 480 --encoding jpeg" uv4l

uv4l --driver raspicam --auto-video_nr --width 640 --height 480 --encoding jpeg


To run it purely by specify the entrypoint

``docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev --entrypoint="bash" daniego/rover-uv4l``





## Coming soon features

- raspicam support
- x86 container

docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -e UV4L_PARAMETERS=" -k -f --sched-rr --mem-lock --driver uvc --device-id `lsusb |grep Ricoh|awk {'print $6'}` --auto-video_nr" daniego/rover-uv4l

docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -entrypoint="uv4l -k -f --sched-rr --mem-lock --driver uvc --device-id `lsusb |grep Ricoh|awk {'print $6'}` --auto-video_nr" daniego/rover-uv4l



Show the video stream. You can optionally specify the preferred 'width' and 'height' attributes in the URL to adjust the displayed image size (not camera resolution) (e.g. '/stream?width=640&height=480). Available raw streams are under the paths /stream/video.mjpeg, /stream/video.jpeg or /stream/video.h264
