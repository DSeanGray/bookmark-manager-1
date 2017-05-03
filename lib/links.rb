require 'data_mapper'
require 'dm-postgres-adapter'

class Links
	include DataMapper::Resource

	has n, :tags, through: Resource

	property :id, Serial
	property :title, String
	property :url, String


end
