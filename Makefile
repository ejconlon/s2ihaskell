BUILDER_TAG=s2ihaskell-builder:lts-13.18
APP_TAG=s2ihaskell-example

.PHONY: prepare
prepare:
	cd builder && docker build -t ${BUILDER_TAG} .

.PHONY: enter
enter:
	docker run -it ${BUILDER_TAG} bash

.PHONY: build
build:
	cd example && s2i build --incremental . ${BUILDER_TAG} ${APP_TAG}
