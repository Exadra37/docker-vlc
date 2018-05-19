# https://github.com/jessfraz/dockerfiles/blob/master/vlc/Dockerfile
FROM debian

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		libgl1-mesa-dri \
		libgl1-mesa-glx \
		pulseaudio \
		alsa-utils \
		dbus* \
		vlc && \
	apt-get -y -f install && \
	useradd -m vlc && \
	usermod -a -G audio,video vlc && \
	rm -rf /var/lib/apt/lists/*
	 
USER vlc

WORKDIR /home/vlc/videos

ENTRYPOINT [ "vlc", "--no-metadata-network-access", "--no-qt-privacy-ask" ]
