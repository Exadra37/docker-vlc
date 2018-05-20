#!/bin/bash
	# -v /run/user/1000/pulse:/run/user/1000/pulse \
	# -v /etc/machine-id:/etc/machine-id \
	# -v ~/.pulse:/home/vlc/.pulse \
	# -v /dev/shm:/dev/shm \

VLC_HOST_DIR=~/.docker-vlc/.config

[ -d $VLC_HOST_DIR ] ||  mkdir -p $VLC_HOST_DIR
 
sudo docker run \
	--rm \
	--detach \
	--name vlc \
	-v /etc/localtime:/etc/localtime:ro \
	-v $PWD:/home/vlc/videos \
	-v $VLC_HOST_DIR:/home/vlc/.config \
	--device /dev/snd \
	--device /dev/dri \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	exadra37/vlc "$@"
