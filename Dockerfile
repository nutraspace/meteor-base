# DOCKER-VERSION 0.3.4
FROM  phusion/passenger-nodejs

RUN	apt-get update
RUN	apt-get install -y curl build-essential git python-software-properties python g++ make openssl graphicsmagick
RUN curl http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz > node-v0.10.35.tar.gz; tar xvf node-v0.10.35.tar.gz; cd node-v0.10.35; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
RUN npm install -g redis;
RUN npm install -g meteorite;
RUN echo tlsv1 > $HOME/.curlrc
