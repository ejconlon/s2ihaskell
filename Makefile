LTS=lts-14.16
BUILDER_TAG=s2ihaskell-builder:${LTS}
RUNTIME_TAG=s2ihaskell-runtime
APP_BUILDER_TAG=s2ihaskell-example-builder
APP_RUNTIME_TAG=s2ihaskell-example-runtime

.PHONY: bump-lts
bump-lts:
	gsed -i'' "s/resolver:.*/resolver: ${LTS}/" example/stack.yaml

.PHONY: prepare-builder
prepare-builder:
	cd builder && docker build --build-arg LTS=${LTS} -t ${BUILDER_TAG} .

.PHONY: enter-builder
enter-builder:
	docker run -it ${BUILDER_TAG} bash

.PHONY: prepare-runtime
prepare-runtime:
	cd runtime && docker build -t ${RUNTIME_TAG} .

.PHONY: enter-runtime
enter-runtime:
	docker run -it ${RUNTIME_TAG} bash

.PHONY: build
assemble-builder:
	cd example && s2i build . ${BUILDER_TAG} ${APP_BUILDER_TAG} --env ROLE=builder --environment-file .environment --incremental

.PHONY: assemble-runtime
assemble-runtime:
	mkdir -p /tmp/empty && s2i build /tmp/empty ${APP_BUILDER_TAG} ${APP_RUNTIME_TAG} --env ROLE=runtime --environment-file example/.environment --runtime-image ${RUNTIME_TAG}

.PHONY: enter-app-builder
enter-app-builder:
	docker run -it ${APP_BUILDER_TAG} bash

.PHONY: enter-app-runtime
enter-app-runtime:
	docker run -it ${APP_RUNTIME_TAG} bash

.PHONY: test
test:
	docker run -t ${APP_BUILDER_TAG}

.PHONY: run
run:
	docker run -t ${APP_RUNTIME_TAG}

.PHONY: full
full: prepare-builder prepare-runtime assemble-builder test assemble-runtime run
