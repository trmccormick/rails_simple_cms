FROM ruby:2.6

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get install -y nodejs
    
# FFMPEG
RUN apt-get install -y ffmpeg \
    && apt-get install -y ffmpegthumbnailer

# Install our dependencies and rails
RUN \
    gem install bundler \
    && gem install rails \
    && mkdir -p /home/simplecms

WORKDIR /home/simplecms
ADD . /home/simplecms
RUN bundle install --jobs=4 --retry=3

ADD ./startup.sh /usr/bin/
RUN chmod -v +x /usr/bin/startup.sh
ENTRYPOINT ["/usr/bin/startup.sh"]