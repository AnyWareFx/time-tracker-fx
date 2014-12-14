require 'data_mapper'
require 'dm-types'
require 'dm-types'
require 'dm-constraints'
require 'dm-serializer'

require './app/models/models'

DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, ENV['DATABASE_URL'] || 'postgres://postgres:postgres@localhost:5432/development'
DataMapper.auto_migrate!
