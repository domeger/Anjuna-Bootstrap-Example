FROM registry.semaphoreci.com/node:16

MAINTAINER Domnick Eger <dom.eger@anjuna.io>

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://gitlab.com/redlineana/production-bidder.git . 

ENV NODE_ENV=development

RUN npm install
RUN npm install --save pm2

RUN ["yarn", "install"]

EXPOSE 3000

CMD ["npm","start"]
