FROM node:23.5.0

EXPOSE 8000

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.2.1/zsh-in-docker.sh)"

ARG APT_DEPS_ZSH="zsh zsh-syntax-highlighting"
ARG APT_DEPS_NEOVIM="ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip git binutils"
ARG APT_DEPS_NEOVIM_PACK="silversearcher-ag"
ARG TARGET=stable

RUN apt update && apt upgrade -y && \
  apt install -y ${APT_DEPS_ZSH} && \
  apt install -y ${APT_DEPS_NEOVIM} && \
  apt install -y ${APT_DEPS_NEOVIM_PACK} && \
  git clone https://github.com/neovim/neovim.git /tmp/neovim && \
  cd /tmp/neovim && \
  git fetch --all --tags -f && \
  git checkout ${TARGET} && \
  make CMAKE_BUILD_TYPE=Release && \
  make CMAKE_INSTALL_PREFIX=/usr/local install && \
  strip /usr/local/bin/nvim

RUN npm i -g gatsby-cli@5.14.0
