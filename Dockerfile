# DOCKER-VERSION 0.3.4
FROM  phusion/passenger-nodejs:0.9.18

#we have to force-confdef due to nginx-common prompt issue http://debian-handbook.info/browse/wheezy/sect.automatic-upgrades.html
#RUN yes '' | apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y update && yes '' | apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y upgrade 

RUN apt-get update

RUN	apt-get install -y curl build-essential git software-properties-common g++ make openssl curl python2.7-dev;

RUN curl http://nodejs.org/dist/v0.10.41/node-v0.10.41.tar.gz > node-v0.10.41.tar.gz; tar xvf node-v0.10.41.tar.gz; cd node-v0.10.41; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
RUN npm install -g redis;
RUN npm install -g meteorite;
#RUN echo tlsv1 > $HOME/.curlrc
 
#RUN cd /; wget http://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz; tar -xvf pbc-0.5.14.tar.gz; cd pbc-0.5.14; ./configure; make; make install;

# will break if crypto isn't setup properly
RUN ls /usr/lib/x86_64-linux-gnu/libcrypto*

#install meteor from source now, mylar:platform ready and capable
RUN curl https://install.meteor.com/ | sh
