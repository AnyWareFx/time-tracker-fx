module TimeTrackerFx

  class Organizations < Routes

    # Get Organization list
    get '/organizations' do
      Organization.all.to_json
    end

  end

end
