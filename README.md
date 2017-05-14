# rover-uv4l

# Build local container
docker build -t thetacontroller .

# Run local container
docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev --entrypoint="bash" roveruv4l

# Example to run quickly uv4l

docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev -e UV4L_PARAMETERS="-k -f --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 --auto-video_nr" roveruv4l


/usr/bin/uv4l -k -f --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 --syslog-host 127.0.0.1 --syslog-port 514 --verbosity 7  --auto-video_nr
