require 'rubygems'
require 'sinatra/base'
require 'sinatra/cross_origin'
require 'data_mapper'
require 'dm-types'
require 'dm-constraints'
require 'dm-serializer'
require 'json'


require './app'
require './app/models/models'


#################################################
#
# Setup DataMapper, and initialize the database
#
DataMapper::Logger.new $stdout, :debug
DataMapper.setup :default, ENV['DATABASE_URL'] || 'postgres://postgres:postgres@localhost:5432/development'
DataMapper.finalize


#################################################
#
# If we're not in our production environment
# startup WEBrick
#
if ENV['RACK_ENV'] != 'production'

  require 'webrick'

  options = {
      :Port => 3000,
      :Logger => WEBrick::Log::new($stderr, WEBrick::Log::DEBUG),
      :DocumentRoot => 'public'
  }
  Rack::Handler::WEBrick.run TimeTrackerFx::App, options

else

  run TimeTrackerFx::App

end
