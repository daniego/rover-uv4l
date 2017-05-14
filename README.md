# rover-uv4l



#### working
docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules -v=/dev:/dev roveruv4l bash

/usr/bin/uv4l -k -f --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 --syslog-host 127.0.0.1 --syslog-port 514 --verbosity 7  --auto-video_nr


#### notes

Apparently the UV4L extension library (libuv4lext.so) has not been preloaded by current application (pid=26136, 0).
You may have to properly set the 'LD_PRELOAD' environmental variable.
The extension module gives enhanced support to many more Video4Linunx applications.
Please refer to the 'uv4l' manual for more informations,


/=====

docker run -it --device /dev/video1 --privileged -v /ffberry:/ffberry roveruv4l bash
docker run -it --device /dev/video1 --privileged -v /ffberry:/ffberry roveruv4l /usr/bin/uv4l -k --sched-rr --mem-lock --config-file=/etc/uv4l/uv4l-uvc.conf --driver uvc --driver-config-file=/etc/uv4l/uv4l-uvc.conf --device-id 05ca:2711


-v /lib/modules:/lib/modules
docker run -it --device /dev/video1 --privileged -v /lib/modules:/lib/modules -v /ffberry:/ffberry roveruv4l /usr/bin/uv4l -k --sched-rr --mem-lock --config-file=/etc/uv4l/uv4l-uvc.conf --driver uvc --driver-config-file=/etc/uv4l/uv4l-uvc.conf --device-id 05ca:2711

 --server-option=--editable-config-file=/etc/uv4l/uv4l-uvc.conf --device-id 05ca:2711


/usr/bin/uv4l -k --sched-rr --mem-lock --config-file=/etc/uv4l/uv4l-uvc.conf --driver uvc --driver-config-file=/etc/uv4l/uv4l-uvc.conf --server-option=--editable-config-file=/etc/uv4l/uv4l-uvc.conf --device-id 05ca:2711


ok
docker run -it --device `v4l2-ctl --list-devices|grep '/dev'|awk {'print $1'}` --privileged -v /lib/modules:/lib/modules -v /ffberry:/ffberry -p 8088:8088 roveruv4l bash

/usr/bin/uv4l -k --sched-rr --mem-lock --config-file=/etc/uv4l/uv4l-uvc.conf --device-id=05ca:2711 -f


/usr/bin/uv4l -k --sched-rr --mem-lock --config-file=/etc/uv4l/uv4l-uvc.conf --device-id=05ca:2711 -f --syslog-host

/usr/bin/uv4l -k --sched-rr --mem-lock --config-file=/etc/uv4l/uv4l-uvc.conf  --driver uvc --driver-config-file=/etc/uv4l/uv4l-uvc.conf --server-option=--editable-config-file=/etc/uv4l/uv4l-uvc.conf  --device-id 05ca:2711 -f


/usr/bin/uv4l -k --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 -f --config-file=/etc/uv4l/uv4l-uvc.conf

/usr/bin/uv4l -k -f --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 --syslog-host 127.0.0.1 --syslog-port 514 --verbosity 7

lsusb | grep Ricoh|awk {'print $6'}


######

docker run -it -v /dev/bus/usb:/dev/bus/usb --privileged -v /lib/modules:/lib/modules -v /ffberry:/ffberry -p 8088:8088 roveruv4l bash

docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` --privileged -p 8080:8080 roveruv4l bash

docker run -it --device=/dev/bus/usb/`lsusb | grep Ricoh|awk {'print $2'}`/`lsusb | grep Ricoh|awk {'print $4'}|sed 's/:$//'` -p 8080:8080 --cap-add=ALL --privileged -v /lib/modules:/lib/modules roveruv4l bash


/usr/bin/uv4l -k --sched-rr --mem-lock --driver uvc --device-id '05ca:2711' -f --verbosity 7 --syslog-host 127.0.0.1 --syslog-port 514 --server-option '--port=8080'


/etc/init.d/uv4l_uvc 05ca:2711

#############
/usr/bin/uv4l -k -f --sched-rr --mem-lock --driver uvc --device-id 05ca:2711 --syslog-host 127.0.0.1 --syslog-port 514 --verbosity 7  --auto-video_nr
<notice> [core] Trying driver 'uvc' from built-in drivers...
<warning> [core] Driver 'uvc' not found
<notice> [core] Trying driver 'uvc' from external plug-in's...
<notice> [driver] Video functionality 'RICOH THETA S' recognized at 05ca:2711
<notice> [core] Device detected!
<notice> [core] Trying to load the the Streaming Server plug-in...
<notice> [server] HTTP/HTTPS Streaming & WebRTC Signalling Server v1.1.95 built on May  4 2017
<warning> [server] SSL is not enabled for the Streaming Server. Using unsecure HTTP.
<notice> [core] Streaming Server loaded!
<notice> [core] Registering device node /dev/uv4l
<notice> [server] Web Streaming Server listening on port 8080


<warning> [server] No such file or directory
