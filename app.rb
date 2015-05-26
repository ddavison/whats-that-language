require 'sinatra'
require 'open-uri'
require './whats_that_language'
require 'haml'

get '/' do
  haml :index, :layout => :layout
end

get '/new' do
  game = WhatsThatLanguage.new
  content_type :json
  game.get_new_gist.to_json
end
