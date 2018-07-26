FROM node:8.11-jessie
MAINTAINER livingmagic <livingmagic.github.com>

EXPOSE 8080

# install maintain tools
#RUN npm install bower grunt-cli graceful-fs@4.1.5 minimatch@3.0.2 -g

# clone latest code from github
RUN git clone --single-branch -b v0.3.4 --depth 1 https://github.com/hyperledger/blockchain-explorer

WORKDIR /blockchain-explorer

#RUN echo '{ "allow_root": true }' > /root/.bowerrc
RUN echo '{ "allow_root": true }' > .bowerrc

# Modify config.json to update the value of channels/mysql/tls
# Or just mount external one inside

RUN npm install

VOLUME /blockchain-explorer

CMD ["bash", "start.sh"]
