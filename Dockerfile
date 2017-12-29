# DOCKER-VERSION 17.09.1-ce-mac42
FROM  phusion/passenger-nodejs:0.9.27

RUN apt-get update

RUN apt-get install -y curl build-essential git software-properties-common g++ make openssl python2.7-dev python;

RUN curl http://nodejs.org/dist/v8.9.3/node-v8.9.3.tar.gz > node-v8.9.3.tar.gz; tar xvf node-v8.9.3.tar.gz; cd node-v8.9.3; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
 
RUN curl https://install.meteor.com/ | sh
