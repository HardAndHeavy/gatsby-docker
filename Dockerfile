FROM alpine:3.9.2

EXPOSE 8000

RUN apk update && apk upgrade

RUN apk add --no-cache git bash

RUN apk add --no-cache nodejs nodejs-npm
RUN npm config set unsafe-perm true
RUN npm i -g gatsby-cli