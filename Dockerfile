FROM jenkins:latest

# Env
ENV PHANTOMJS_VERSION 1.9.6
ENV PHANTOMJS_YSLOW_VERSION 3.1.8
ENV SHARE_BIN /var/share

# Install stuff by using root
USER root
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git wget libfreetype6 libfontconfig bzip2

RUN mkdir -p $SHARE_BIN

RUN wget -q --no-check-certificate -O /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
RUN tar -xjf /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 -C /tmp
RUN rm -f /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
RUN mv /tmp/phantomjs-$PHANTOMJS_VERSION-linux-x86_64/ $SHARE_BIN/phantomjs
RUN ln -s $SHARE_BIN/phantomjs/bin/phantomjs /usr/bin/phantomjs

RUN wget -q --no-check-certificate -O /tmp/yslow-phantomjs-$PHANTOMJS_YSLOW_VERSION.zip http://yslow.org/yslow-phantomjs-$PHANTOMJS_YSLOW_VERSION.zip
RUN unzip /tmp/yslow-phantomjs-$PHANTOMJS_YSLOW_VERSION.zip -d $SHARE_BIN/
USER jenkins