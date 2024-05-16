REGISTRY := $(if $(REGISTRY),$(REGISTRY),staging-k8s.gcr.io)
IMAGE_TAG := $(if $(IMAGE_TAG),$(IMAGE_TAG),latest)

all: gcloudpush

build:
        docker build --pull -t $(REGISTRY)/clusterloader2:$(IMAGE_TAG) .

gcloudpush: build
        docker push $(REGISTRY)/clusterloader2:$(IMAGE_TAG)

push: build
        docker push $(REGISTRY)/clusterloader2:$(IMAGE_TAG)

.PHONY: all build gcloudpush push
