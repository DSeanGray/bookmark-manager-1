ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'simplecov'
require 'sinatra'
require 'simplecov-console'
require 'data_mapper'
require './lib/links'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end



require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = App
