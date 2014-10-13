require 'sinatra'
require "sinatra/config_file"
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'slim'
require 'irkit'
require_relative 'app.rb'

config_file 'config.yml'

run Sinatra::Application
