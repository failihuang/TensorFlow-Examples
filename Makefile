REPO=bitfusionio
PROJ=tensorflow_examples

DOCKER=docker

login:
	docker login -u ${DOCKER_HUB_USER} -p ${DOCKER_HUB_PWD}

build-runtime:
	$(DOCKER) build --pull \
		--tag ${REPO}/${PROJ}:9.0-runtime-ubuntu16.04 \
		-f Dockerfile.runtime .
	$(DOCKER) push ${REPO}/${PROJ}:9.0-runtime-ubuntu16.04
	$(DOCKER) rmi ${REPO}/${PROJ}:9.0-runtime-ubuntu16.04

build-devel:
	$(DOCKER) build --pull \
		--tag ${REPO}/${PROJ}:9.0-devel-ubuntu16.04 \
		-f Dockerfile.devel .
	$(DOCKER) push ${REPO}/${PROJ}:9.0-devel-ubuntu16.04
	$(DOCKER) rmi ${REPO}/${PROJ}:9.0-devel-ubuntu16.04

build-all: build-runtime build-devel
