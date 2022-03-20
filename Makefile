#MAKEFLAGS += --silent

.PHONY: debos
debos:
	docker run --rm -tv ${PWD}:${PWD} --tmpfs /dev/shm:rw,nosuid,nodev,exec,size=4g \
	--security-opt label=disable --user $(shell id -u) \
	--workdir ${PWD} godebos/debos ${PWD}/${RECIPE_FILE} -t distro:${DISTRO}

.PHONY: debian
debian: RECIPE_FILE = debian/image.yaml
debian: DISTRO = debian
debian: debos

.PHONY: ubuntu
ubuntu: RECIPE_FILE = debian/image.yaml
ubuntu: DISTRO = ubuntu
ubuntu: debos