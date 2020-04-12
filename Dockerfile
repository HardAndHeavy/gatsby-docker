FROM node:13.12.0

EXPOSE 8000

RUN npm config set unsafe-perm true
RUN npm i -g gatsby-cli@2.11.7