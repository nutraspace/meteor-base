# DOCKER-VERSION 0.3.4
FROM  phusion/passenger-nodejs

RUN apt-get update -y && apt-get upgrade -y

RUN	apt-get install -y curl build-essential git python-software-properties python g++ make openssl graphicsmagick libgmp10 libgmp10-dev libcrypto++9 libreadline5 libreadline-dev libntl0 libntl-dev wget flex bison zlib1g-dev libssl-dev curl;

RUN curl http://nodejs.org/dist/v0.10.36/node-v0.10.36.tar.gz > node-v0.10.36.tar.gz; tar xvf node-v0.10.36.tar.gz; cd node-v0.10.36; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
RUN npm install -g redis;
RUN npm install -g meteorite;
RUN echo tlsv1 > $HOME/.curlrc
 
RUN cd /; wget http://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz; tar -xvf pbc-0.5.14.tar.gz; cd pbc-0.5.14; ./configure; make; make install;

# will break if crypto isn't setup
RUN ls /usr/lib/x86_64-linux-gnu/libcrypto*

#install meteor from source now
RUN curl https://install.meteor.com/ | sh
