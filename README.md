# armhf-alpine-gogs

ARM hf compatible Docker Image with a minimal `gogs` server (https://gogs.io/). Without ssh.

## Details
- [Source Project Page](https://github.com/werwolfby/docker-armhf-alpine-gogs.git)
- [Source Repository](https://github.com/werwolfby/docker-armhf-alpine-gogs.git)
- [Dockerfile](https://github.com/werwolfby/docker-armhf-alpine-gogs/blob/master/Dockerfile)

## Start a gogs server
```bash
docker run -d --name my-gogs \
  -p 3000:3000 \
  -v /path/to/store/repositories:/data/repo \
  -v /path/to/store/database:/data/db \
  werwolfby/armhf-alpine-gogs
```

Navigate to http://your-arm-device-ip:3000/

And finish install over web server setup

Start server:
```bash
docker run my-gogs
```

## How to create this image

Run all commands from within the project root directory.

### Create image
Create folder. Folder name will be used for image name by default. 
Checkout this repository. And run.
```bash
git clone https://github.com/werwolfby/docker-armhf-alpine-gogs.git .
make build
```

Copy `env.template` to `env`. Edit the file settings to your particular settings.
Specify path for downloading torrents and path for storing intermediate settings and results.
```bash
REPOSITORIES_VOLUME=/path/to/store/repositories
DB_VOLUME=REPOSITORIES_VOLUME
```

### Run container from image
```bash
make run
```
