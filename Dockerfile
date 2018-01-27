# DOCKER-VERSION 17.12.0-ce-mac49
FROM  phusion/passenger-nodejs:0.9.27

RUN apt-get update

RUN apt-get install -y curl build-essential git software-properties-common g++ make openssl python2.7-dev python;

RUN curl http://nodejs.org/dist/v8.9.4/node-v8.9.4.tar.gz > node-v8.9.4.tar.gz; tar xvf node-v8.9.4.tar.gz; cd node-v8.9.4; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
 
RUN curl https://install.meteor.com/ | sh
