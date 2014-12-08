module TimeTrackerFx

  class Associates < Routes

    # Create an Associate for the given Organization
    post '/organizations/:id/associates' do
      organization = Organization.get params[:id]
      if organization
        data = JSON.parse request.body.read
        associate = organization.associates.new
        associate.attributes = data
        if associate.save
          headers 'location' => '/associates/' + associate.id.to_s
          status 201
        else
          status 412
        end
      else
        status 404
      end
    end

    # Create a Consultant for the given Organization
    post '/organizations/:id/consultants' do
      organization = Organization.get params[:id]
      if organization
        data = JSON.parse request.body.read
        consultant = Consultant.new :organization_id => params[:id]
        consultant.attributes = data
        if consultant.save
          headers 'location' => '/associates/' + consultant.id.to_s
          status 201
        else
          status 412
        end
      else
        status 404
      end
    end

    # Get all Associates for the given Organization
    get '/organizations/:id/associates' do
      Associate.all(:organization_id => params[:id]).to_json
    end

    # Update a Associate
    put '/associates/:id' do
      associate = Associate.get params[:id]
      if associate
        data = JSON.parse request.body.read
        associate.attributes = data
        if associate.save
          status 200
        else
          status 412
        end
      else
        status 404
      end
    end

    # Remove a Associate
    delete '/associates/:id' do
      associate = Associate.get params[:id]
      if associate
        associate.destroy
      else
        status 404
      end
    end

  end

end
