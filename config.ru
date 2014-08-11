require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'slim'
require 'irkit'
require_relative 'app.rb'

run Sinatra::Application
