# Image URL to use all building/pushing image targets
IMG ?= uhziel/wine:0.2.0

docker: docker-build docker-push

docker-build:
	docker build -t ${IMG} .

docker-push:
	docker push ${IMG}

