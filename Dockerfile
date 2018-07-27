FROM node:8.11-jessie
MAINTAINER livingmagic <livingmagic.github.com>

EXPOSE 8080

# clone latest code from github
RUN git clone --single-branch -b v0.3.4 --depth 1 https://github.com/hyperledger/blockchain-explorer

WORKDIR /blockchain-explorer

RUN echo '{ "allow_root": true }' > .bowerrc

RUN npm install

RUN /bin/sh -c 'cd client && npm install && npm run build'

# volume blockchain directory
VOLUME /blockchain-explorer

CMD ["bash", "start.sh"]
