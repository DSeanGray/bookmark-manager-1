require 'sinatra/base'
require './lib/links'

class App < Sinatra::Base
  #enable :sessions

  get '/' do
  end 

  get '/links' do
    @links = Links.all
    erb :link
  end
end
