require 'rubygems'
require 'sinatra/base'

%w(routes associates organizations projects stories time_sheets).each do |route|
  require "#{Dir.pwd}/app/routes/#{route}"
end


module TimeTrackerFx

  class App < Sinatra::Base
    use Associates
    use Organizations
    use Projects
    use Stories
    use TimeSheets

    get '/' do
      redirect 'index.html'
    end
  end
  
end