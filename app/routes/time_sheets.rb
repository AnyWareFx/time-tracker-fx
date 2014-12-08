module TimeTrackerFx

  class TimeSheets < Routes

    # Create a TimeSheet for the given Consultant
    post '/consultants/:id/time_sheets' do
      data = JSON.parse request.body.read
      time_sheet = TimeSheet.new :consultant_id => params[:id]
      time_sheet.attributes = data
      if time_sheet.save
        headers 'location' => '/time_sheets/' + time_sheet.id.to_s
        status 201
      else
        status 412
      end
    end

    # Get all TimeSheets for the given Consultant
    get '/consultants/:id/time_sheets' do
      TimeSheet.all(:consultant_id => params[:id]).to_json
    end

    # Update a TimeSheet
    put '/time_sheets/:id' do
      time_sheet = TimeSheet.get params[:id]
      if time_sheet
        data = JSON.parse request.body.read
        time_sheet.attributes = data
        if time_sheet.save
          status 200
        else
          status 412
        end
      else
        status 404
      end
    end

    # Remove a TimeSheet
    delete '/time_sheets/:id' do
      time_sheet = TimeSheet.get params[:id]
      if time_sheet
        time_sheet.destroy
      else
        status 404
      end
    end


    # Create an Entry for the given TimeSheet
    post '/time_sheet/:id/entries' do
      data = JSON.parse request.body.read
      entry = TimeSheetEntry.new
      entry.attributes = data
      if entry.save
        headers 'location' => '/entries/' + entry.id.to_s
        status 201
      else
        status 412
      end
    end

    # Get Entries for the given TimeSheet
    get '/time_sheet/:id/entries' do
      TimeSheetEntry.all(:time_sheet_id => params[:id]).to_json
    end

    # Update an Entry
    put '/entries/:id' do
      entry = TimeSheetEntry.get params[:id]
      if entry
        data = JSON.parse request.body.read
        entry.attributes = data
        if entry.save
          status 200
        else
          status 412
        end
      else
        status 404
      end
    end

    # Remove an Entry
    delete '/entries/:id' do
      entry = TimeSheetEntry.get params[:id]
      if entry
        entry.destroy
      else
        status 404
      end
    end

  end

end
