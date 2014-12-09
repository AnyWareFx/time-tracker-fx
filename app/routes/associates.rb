module TimeTrackerFx

  class Associates < Routes

    # Get all Associates for the given Organization
    get '/organizations/:id/associates' do
      Associate.all(:organization_id => params[:id]).to_json
    end

    # Create an Associate for the given Organization
    post '/organizations/:id/associates' do
      organization = Organization.get params[:id]
      if organization
        create organization.associates.new, '/api/associates/'
      else
        status 404
      end
    end

    # Create a Consultant for the given Organization
    post '/organizations/:id/consultants' do
      organization = Organization.get params[:id]
      if organization
        consultant = Consultant.new :organization_id => params[:id]
        create consultant, '/api/associates/'
      else
        status 404
      end
    end

    # Lookup an Associate
    get '/associates/:id' do
      lookup Associate.get params[:id]
    end

    # Update an Associate
    put '/associates/:id' do
      update Associate.get params[:id]
    end

    # Remove an Associate
    delete '/associates/:id' do
      destroy Associate.get params[:id]
    end


    # Get all Estimates for the given Consultant
    get '/consultants/:id/estimates' do
      Estimate.all(:consultant_id => params[:id]).to_json
    end

    # Create an Estimate for the given Consultant
    post '/consultants/:id/estimates' do
      consultant = Consultant.get params[:id]
      if consultant
        estimate = Estimate.new :consultant_id => params[:id]
        create estimate, '/api/estimates/'
      else
        status 404
      end
    end

    # Lookup an Estimate
    get '/estimates/:id' do
      lookup Estimate.get params[:id]
    end

    # Update an Estimate
    put '/estimates/:id' do
      update Estimate.get params[:id]
    end

    # Remove an Estimate
    delete '/estimates/:id' do
      destroy Estimate.get params[:id]
    end

  end

end
