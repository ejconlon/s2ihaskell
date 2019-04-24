BUILDER_TAG=s2ihaskell-builder:lts-13.18
APP_TAG=s2ihaskell-example

.PHONY: prepare
prepare:
	cd builder && docker build -t ${BUILDER_TAG} .

.PHONY: enter-builder
enter-builder:
	docker run -it ${BUILDER_TAG} bash

.PHONY: build
build:
	cd example && s2i build --incremental . --environment-file .environment ${BUILDER_TAG} ${APP_TAG}

.PHONY: enter-app
enter-app:
	docker run -it ${APP_TAG} bash

.PHONY: run
run:
	docker run -t ${APP_TAG}
