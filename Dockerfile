FROM node:14.15.3

EXPOSE 8000

RUN npm config set unsafe-perm true
RUN npm i -g gatsby-cli@2.16.2