module TimeTrackerFx

  class Stories < Routes

    # Create a Story for the given Project
    post '/projects/:id/stories' do
      data = JSON.parse request.body.read
      story = Story.new
      story.attributes = data
      if story.save
        headers 'location' => '/stories/' + story.id.to_s
        status 201
      else
        status 412
      end
    end

    # Get all Stories for the given Project
    get '/projects/:id/stories' do
      Story.all(:project_id => params[:id]).to_json
    end

    # Update a Story
    put '/stories/:id' do
      story = Story.get params[:id]
      if story
        data = JSON.parse request.body.read
        story.attributes = data
        if story.save
          status 200
        else
          status 412
        end
      else
        status 404
      end
    end

    # Remove a Story
    delete '/stories/:id' do
      story = Story.get params[:id]
      if story
        story.destroy
      else
        status 404
      end
    end


    # Create a Task for the given Story
    post '/story/:id/tasks' do
      data = JSON.parse request.body.read
      task = StoryTask.new
      task.attributes = data
      if task.save
        headers 'location' => '/tasks/' + task.id.to_s
        status 201
      else
        status 412
      end
    end

    # Get Tasks for the given Story
    get '/story/:id/tasks' do
      StoryTask.all(:story_id => params[:id]).to_json
    end

    # Update a Task
    put '/tasks/:id' do
      task = StoryTask.get params[:id]
      if task
        data = JSON.parse request.body.read
        task.attributes = data
        if task.save
          status 200
        else
          status 412
        end
      else
        status 404
      end
    end

    # Remove a Task
    delete '/tasks/:id' do
      task = StoryTask.get params[:id]
      if task
        task.destroy
      else
        status 404
      end  
    end

  end

end
