FROM node:latest

EXPOSE 8000

RUN apt-get update && apt-get upgrade -y

RUN npm config set unsafe-perm true
RUN npm i -g gatsby-cli@2.11.7