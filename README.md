# VLC MEDIA PLAYER ON DOCKER

Dockerizing the awesome [VLC Media Player](https://www.videolan.org/).


## How to Install

All we need is to download this package and add the bash script `bin/vlc.sh` to our path.

Lets assume that your path is in `/usr/bin` and that this package will be located in `~/.vlc`.

Cloning the package...

```bash
git clone git@gitlab.com:exadra37-docker/media-player/vlc.git ~/.vlc
```

Creating the sym link...

```bash
sudo ln -s ~/.vlc/bin/vlc.sh /usr/bin/vlc
```

Building the Docker Image...

```bash
sudo docker build -t exadra37/vlc ~/.vlc/docker/build
```

## How to use

No matter how we start `vlc` it will map always the current folder into inside the Docker Container
at `/home/vlc/videos`.

### To open a file

```bash
vlc path/to/file
```

### To open a folder

```bash
vlc path/to/folder
```

### To open only the User Interface

```bash
vlc
```