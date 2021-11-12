USER = "$(shell id -u):$(shell id -g)"
GATSBY_DIR = $(PWD)/projects

build:
	docker build . -t hardandheavy/gatsby-docker

push:
	docker push hardandheavy/gatsby-docker

bash: prepare
	docker run -it --rm \
		-e HOME=$(HOME) \
		-v $(GATSBY_DIR):$(HOME) \
		-w $(HOME) \
		-v $(HOME)/.gitconfig:$(HOME)/.gitconfig \
		-v $(HOME)/.bash_history:$(HOME)/.bash_history \
		-v $(HOME)/.bashrc:$(HOME)/.bashrc \
		-v /etc/passwd:/etc/passwd \
		-p 8000:8000 \
		--user=$(USER) \
		hardandheavy/gatsby-docker bash

prepare:
	mkdir -p projects