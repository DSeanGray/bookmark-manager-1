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

  get '/submit' do
    erb :submit
  end

  post '/add' do
  	Links.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

end
