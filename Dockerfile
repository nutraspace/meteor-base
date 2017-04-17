# DOCKER-VERSION 0.3.4
FROM  phusion/passenger-nodejs:0.9.18

RUN apt-get update

RUN apt-get install -y curl build-essential git software-properties-common g++ make openssl python2.7-dev python;

RUN curl http://nodejs.org/dist/v4.8.0/node-v4.8.0.tar.gz > node-v4.8.0.tar.gz; tar xvf node-v4.8.0.tar.gz; cd node-v4.8.0; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
 
RUN curl https://install.meteor.com/ | sh
