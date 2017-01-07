FROM syon/ubuntu-ruby

# IRKit dependency
RUN apt-get install -y libavahi-compat-libdnssd-dev

# Locale (Allows IRKit japanese key name)
RUN apt-get install -y language-pack-ja-base language-pack-ja
ENV LC_ALL=ja_JP.UTF-8

# Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

# App
WORKDIR /app
COPY . /app

# Run
EXPOSE 5000
CMD ["foreman", "start"]
