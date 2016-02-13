FROM jenkins:latest

# Env
ENV PHANTOMJS_VERSION 1.9.7
ENV PHANTOMJS_YSLOW_VERSION 3.1.8
ENV LOCAL_FOLDER /var/3dparty

# Install stuff by using root
USER root
RUN apt-get update
RUN apt-get install -y git wget libfreetype6 libfontconfig bzip2

# Install everything else by using jenkins
USER jenkins
RUN mkdir -p $LOCAL_FOLDER

RUN wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
RUN tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp
RUN rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
RUN mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ $LOCAL_FOLDER/phantomjs
RUN ln -s $LOCAL_FOLDER/phantomjs/bin/phantomjs /usr/bin/phantomjs

RUN wget -q --no-check-certificate -O /tmp/yslow-phantomjs-$PHANTOMJS_YSLOW_VERSION.zip http://yslow.org/yslow-phantomjs-$PHANTOMJS_YSLOW_VERSION.zip
RUN unzip /tmp/yslow-phantomjs-$PHANTOMJS_YSLOW_VERSION.zip -d $LOCAL_FOLDER/