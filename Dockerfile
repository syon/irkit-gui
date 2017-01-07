FROM syon/ubuntu-ruby

# IRKit dependency
RUN apt-get install -y libavahi-compat-libdnssd-dev

# Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

# App
WORKDIR /app
COPY . /app
COPY ./.irkit.json /root/

# Run
EXPOSE 5000
CMD ["foreman", "start"]
