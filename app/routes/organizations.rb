module TimeTrackerFx

  class Organizations < Routes

    # Get all Organizations
    get '/organizations/?' do
      Organization.all.to_json
    end

    # Create an Organization
    post '/organizations/?' do
      create Organization.new, '/api/organizations/'
    end

    # Lookup an Organization
    get '/organizations/:id' do
      lookup Organization.get params[:id]
    end

    # Update an Organization
    put '/organizations/:id' do
      update Organization.get params[:id]
    end

    # Remove an Organization
    delete '/organizations/:id' do
      destroy Organization.get params[:id]
    end

  end

end
