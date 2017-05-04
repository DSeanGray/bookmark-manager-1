require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'lib/tag'
require_relative 'lib/links'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/David/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
