#!/bin/sh
bundle exec unicorn -p 4444 -c ./unicorn.rb -D
