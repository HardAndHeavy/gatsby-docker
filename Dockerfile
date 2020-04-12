FROM node:latest

EXPOSE 8000

RUN npm config set unsafe-perm true
RUN npm i -g gatsby-cli@2.11.7