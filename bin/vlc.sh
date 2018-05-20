#!/bin/bash
	

########################################################################################################################
# Defaults
########################################################################################################################

	VLC_HOST_CONFIG_DIR=~/.docker-vlc/.config
	VLC_HOST_CACHE_DIR=~/.docker-vlc/.cache
	VLC_HOST_SNAPSHOTS_DIR=~/Pictures/VLC/Snapshots

	[ -d $VLC_HOST_CONFIG_DIR ] ||  mkdir -p $VLC_HOST_CONFIG_DIR
	[ -d $VLC_HOST_CACHE_DIR ] ||  mkdir -p $VLC_HOST_CACHE_DIR
	[ -d $VLC_HOST_SNAPSHOTS_DIR ] ||  mkdir -p $VLC_HOST_SNAPSHOTS_DIR


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
		--volume $PWD:/home/vlc/media \
		--volume $VLC_HOST_CONFIG_DIR:/home/vlc/.config \
		--volume $VLC_HOST_CACHE_DIR:/home/vlc/.cache \
		--volume $VLC_HOST_SNAPSHOTS_DIR:/home/vlc/snapshots \
		--volume /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$DISPLAY \
		exadra37/vlc "$@"
