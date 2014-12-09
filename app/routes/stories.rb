module TimeTrackerFx

  class Stories < Routes

    # Get all Stories for the given Project
    get '/projects/:id/stories' do
      Story.all(:project_id => params[:id]).to_json
    end

    # Create a Story for the given Project
    post '/projects/:id/stories' do
      project = Project.get params[:id]
      if project
        create project.stories.new, '/api/stories/'
      else
        status 404
      end
    end

    # Lookup a Story
    get '/stories/:id' do
      lookup Story.get params[:id]
    end

    # Update a Story
    put '/stories/:id' do
      update Story.get params[:id]
    end

    # Remove a Story
    delete '/stories/:id' do
      destroy Story.get params[:id]
    end


    # Get all Tasks for the given Story
    get '/stories/:id/tasks' do
      Task.all(:story_id => params[:id]).to_json
    end

    # Create a Task for the given Story
    post '/stories/:id/tasks' do
      story = Story.get params[:id]
      if story
        create story.tasks.new, '/api/tasks/'
      else
        status 404
      end
    end

    # Lookup a Task
    get '/tasks/:id' do
      lookup Task.get params[:id]
    end

    # Update a Task
    put '/tasks/:id' do
      update Task.get params[:id]
    end

    # Remove a Task
    delete '/tasks/:id' do
      destroy Task.get params[:id]
    end

  end

end
