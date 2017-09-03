require 'sinatra'
require 'sinatra/json'
require 'sinatra/config_file'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'slim'
require 'irkit'
require_relative 'app.rb'

config_file 'config.yml'

set :public_folder, File.dirname(__FILE__) + '/app/dist'

run Sinatra::Application
