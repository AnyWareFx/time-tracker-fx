module TimeTrackerFx

  class Routes < Sinatra::Base

    before do
      content_type 'application/json'

      env['PATH_INFO'].sub! /^\/api/, ''
    end

  end
end
