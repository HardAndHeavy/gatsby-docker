FROM node:16

EXPOSE 8000

RUN npm config set unsafe-perm true
RUN npm i -g gatsby-cli@4.0.0