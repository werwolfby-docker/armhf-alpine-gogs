include env
IMAGENAME := $(shell basename `git rev-parse --show-toplevel`)
NAMESPACE := werwolfby
SHA := $(shell git rev-parse --short HEAD)
timestamp := $(shell date +"%Y%m%d%H%M")


download:
	#wget https://github.com/gogits/gogs/releases/download/$(GOGS_VERSION)/linux_arm.zip -O gogs.zip
	rm -R gogs || true
	unzip gogs.zip
	mkdir -p gogs/custom/conf
	cp app.ini gogs/custom/conf


build:
	docker rmi -f $(NAMESPACE)/$(IMAGENAME):bak || true
	docker tag $(NAMESPACE)/$(IMAGENAME) $(NAMESPACE)/$(IMAGENAME):bak || true
	docker rmi -f $(NAMESPACE)/$(IMAGENAME) || true
	docker build -t $(NAMESPACE)/$(IMAGENAME) .


run:
	docker rm $(CONTAINER_NAME) || true
	docker run -d --name $(CONTAINER_NAME) $(PORTS) $(VOLUMES) $(NAMESPACE)/$(IMAGENAME)


forcerun: stop rmf run


stop:
	docker stop $(CONTAINER_NAME)


start:
	docker start $(CONTAINER_NAME)


rmf:
	docker rm -f $(CONTAINER_NAME)


rmi:
	docker rmi $(NAMESPACE)/$(IMAGENAME)
