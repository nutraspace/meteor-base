# DOCKER-VERSION 0.3.4
FROM  phusion/passenger-nodejs:0.9.20

#we have to force-confdef due to nginx-common prompt issue http://debian-handbook.info/browse/wheezy/sect.automatic-upgrades.html
#RUN yes '' | apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y update && yes '' | apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -y upgrade 

RUN apt-get update

RUN apt-get install -y curl build-essential git software-properties-common g++ make openssl python2.7-dev python;

RUN curl http://nodejs.org/dist/v4.8.1/node-v4.8.1.tar.gz > node-v4.8.1.tar.gz; tar xvf node-v4.8.1.tar.gz; cd node-v4.8.1; ./configure; make; make install;

RUN npm config set registry http://registry.npmjs.org/
RUN npm install -g node-gyp;
#RUN echo tlsv1 > $HOME/.curlrc
 
#RUN cd /; wget http://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz; tar -xvf pbc-0.5.14.tar.gz; cd pbc-0.5.14; ./configure; make; make install;

# will break if crypto isn't setup properly
#RUN ls /usr/lib/x86_64-linux-gnu/libcrypto*

#install meteor from source now, mylar:platform ready and capable
RUN curl https://install.meteor.com/ | sh
