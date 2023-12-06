UID_GID = "$(shell id -u):$(shell id -g)"
DOTFILES_DIR = /projects/dotfiles
GATSBY_DIR = /projects

build:
	docker build -t gatsby-docker:$(tag) .

publish:
	docker image tag gatsby-docker:$(tag) hardandheavy/gatsby-docker:$(tag)
	docker push hardandheavy/gatsby-docker:$(tag)
	docker image tag gatsby-docker:$(tag) hardandheavy/gatsby-docker:latest
	docker push hardandheavy/gatsby-docker:latest

test:
	docker run -it --rm \
		-e HOME=$(HOME) \
		-v $(HOME):$(HOME) \
		-v $(DOTFILES_DIR):$(DOTFILES_DIR) \
		-v $(GATSBY_DIR):/projects \
		-w /projects \
		-v /etc/passwd:/etc/passwd \
		-p 8000:8000 \
		--user=$(UID_GID) \
		-e USER=$(USER) \
		-e HOST=gatsby \
		gatsby-docker:$(tag) zsh

bash:
	docker run -it --rm \
		-e HOME=$(HOME) \
		-v $(HOME):$(HOME) \
		-v $(DOTFILES_DIR):$(DOTFILES_DIR) \
		-v $(GATSBY_DIR):/projects \
		-w /projects \
		-v /etc/passwd:/etc/passwd \
		-p 8000:8000 \
		--user=$(UID_GID) \
		-e USER=$(USER) \
		-e HOST=gatsby \
		hardandheavy/gatsby-docker:latest zsh
