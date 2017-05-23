FROM ruby:2.3.3
# run update
RUN apt-get update -qq
# install dependencies
RUN apt-get install -y build-essential libpq-dev nodejs mysql-client git imagemagick

# Trying RUN apt-get install y FFMPEG fails
# alternative install below
# RUN apt-get -y install software-properties-common
# RUN add-apt-repository ppa:mc3man/trusty-media
# RUN apt-get update
# RUN apt-get install ffmpeg

# add rails
RUN gem install bundler
RUN gem install rails

# make working directory and move files over
RUN mkdir /home/simplecms
WORKDIR /home/simplecms
ADD . /home/simplecms
RUN cd /home/simplecms
