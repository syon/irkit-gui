#!/bin/sh
rbenv global 2.1.0
bundle exec unicorn -p 4444 -c ./unicorn.rb -D
