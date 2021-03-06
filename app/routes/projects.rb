module TimeTrackerFx

  class Projects < Routes

    # Get all Projects for the given Organization
    get '/organizations/:id/projects/?' do
      Project.all(:organization_id => params[:id]).to_json
    end

    # Create an Project for the given Organization
    post '/organizations/:id/projects/?' do
      organization = Organization.get params[:id]
      if organization
        create organization.projects.new, '/api/projects/'
      else
        status 404
      end
    end

    # Lookup an Project
    get '/projects/:id' do
      lookup Project.get params[:id]
    end

    # Update an Project
    put '/projects/:id' do
      update Project.get params[:id]
    end

    # Remove an Project
    delete '/projects/:id' do
      destroy Project.get params[:id]
    end


    # Get all Assigned Associates for the given Project
    get '/projects/:id/associates/?' do
      Assignment.all(:project_id => params[:id]).to_json(methods: [:associate])
    end

    # Assign an Associate to the given Project
    post '/projects/:id/associates/?' do
      project = Project.get params[:id]
      if project
        create project.assignments.new, '/api/assignments/'
      else
        status 404
      end
    end

    # Lookup an Assignment
    get '/assignments/:id' do
      lookup Assignment.get params[:id]
    end

    # Update an Assignment
    put '/assignments/:id' do
      update Assignment.get params[:id]
    end

    # Remove an Assignment
    delete '/assignments/:id' do
      destroy Assignment.get params[:id]
    end

  end

end
