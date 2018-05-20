#!/bin/bash
	

########################################################################################################################
# Defaults
########################################################################################################################

	VLC_HOST_DIR=~/.docker-vlc/.config

	[ -d $VLC_HOST_DIR ] ||  mkdir -p $VLC_HOST_DIR


########################################################################################################################
# Execution
########################################################################################################################

	# --volume /run/user/1000/pulse:/run/user/1000/pulse \
	# --volume /etc/machine-id:/etc/machine-id \
	# --volume ~/.pulse:/home/vlc/.pulse \
	# --volume /dev/shm:/dev/shm \
	sudo docker run \
		--rm \
		--detach \
		--name vlc \
		--device /dev/snd \
		--device /dev/dri \
		--volume /etc/localtime:/etc/localtime:ro \
		--volume $PWD:/home/vlc/videos \
		--volume $VLC_HOST_DIR:/home/vlc/.config \
		--volume /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		exadra37/vlc "$@"
