module TimeTrackerFx

  class Projects < Routes

    # Create a Project for the given Organization
    post '/organizations/:id/projects' do
      organization = Organization.get params[:id]
      if organization
        data = JSON.parse request.body.read
        project = organization.projects.new
        project.attributes = data
        if project.save
          headers 'location' => '/projects/' + project.id.to_s
          status 201
        else
          status 412
        end
      else
        status 404
      end
    end

    # Get all Projects for the given Organization
    get '/organizations/:id/projects' do
      Project.all(:organization_id => params[:id]).to_json
    end

    # Update a Project
    put '/projects/:id' do
      project = Project.get params[:id]
      if project
        data = JSON.parse request.body.read
        project.attributes = data
        if project.save
          status 200
        else
          status 412
        end
      else
        status 404
      end
    end

    # Remove a Project
    delete '/projects/:id' do
      project = Project.get params[:id]
      if project
        project.destroy
      else
        status 404
      end
    end

  end

end
