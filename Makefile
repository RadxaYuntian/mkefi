#MAKEFLAGS += --silent

.PHONY: debos debian

debos:
	docker run --rm -itv ${PWD}:${PWD} --device /dev/kvm \
	--security-opt label=disable --user $(shell id -u) \
	--workdir ${PWD} godebos/debos ${PWD}/${RECIPE_FILE}

debian: RECIPE_FILE=debian/image.yaml
debian: debos