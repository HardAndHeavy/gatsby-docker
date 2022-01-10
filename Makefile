USER = "$(shell id -u):$(shell id -g)"
DOTFILES_DIR = /projects/dotfiles
GATSBY_DIR = /projects/gatsby-docker/projects

build:
	docker build . -t hardandheavy/gatsby-docker

push:
	docker push hardandheavy/gatsby-docker

dev: prepare
	docker run -it --rm \
		-e HOME=$(HOME) \
		-v $(HOME):$(HOME) \
		-v $(DOTFILES_DIR):$(DOTFILES_DIR) \
		-v $(GATSBY_DIR):/projects \
		-w /projects \
		-v /etc/passwd:/etc/passwd \
		-p 8000:8000 \
		--user=$(USER) \
		hardandheavy/gatsby-docker zsh

prepare:
	mkdir -p $(GATSBY_DIR)
