require 'data_mapper'
require 'dm-types'

require './app/models/models'

DataMapper::Logger.new $stdout, :debug
# DataMapper.setup :default, ENV['DATABASE_URL'] || 'sqlite::memory:' # "sqlite:#{Dir.pwd}/data/development.db"  # 'sqlite::memory:'
DataMapper.setup :default, ENV['DATABASE_URL'] || 'postgres://postgres:postgres@localhost:5432/development'
DataMapper.finalize
DataMapper.auto_migrate!
