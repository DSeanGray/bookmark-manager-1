ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require './lib/links'
require './lib/tag'
require_relative './data_mapper_setup'

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
  	link = Links.create(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

end
