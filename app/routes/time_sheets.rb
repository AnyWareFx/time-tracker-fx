module TimeTrackerFx

  class TimeSheets < Routes

    # Get all TimeSheets for the given Consultant
    get '/consultants/:id/time_sheets' do
      TimeSheet.all(:consultant_id => params[:id]).to_json
    end

    # Create a TimeSheet for the given Consultant
    post '/consultants/:id/time_sheets' do
      consultant = Consultant.get params[:id]
      if consultant
        create consultant.time_sheets.new, '/api/time_sheets/'
      else
        status 404
      end
    end

    # Lookup a TimeSheet
    get '/time_sheets/:id' do
      lookup TimeSheet.get params[:id]
    end

    # Update a TimeSheet
    put '/time_sheets/:id' do
      update TimeSheet.get params[:id]
    end

    # Remove a TimeSheet
    delete '/time_sheets/:id' do
      destroy TimeSheet.get params[:id]
    end


    # Get all Entries for the given TimeSheet
    get '/time_sheets/:id/entries' do
      TimeSheetEntry.all(:time_sheet_id => params[:id]).to_json
    end

    # Create an Entry for the given TimeSheet
    post '/time_sheets/:id/entries' do
      time_sheet = TimeSheet.get params[:id]
      if time_sheet
        create time_sheet.entries.new, '/api/entries/'
      else
        status 404
      end
    end

    # Lookup an Entry
    get '/entries/:id' do
      lookup TimeSheetEntry.get params[:id]
    end

    # Update an Entry
    put '/entries/:id' do
      update TimeSheetEntry.get params[:id]
    end

    # Remove an Entry
    delete '/entries/:id' do
      destroy TimeSheetEntry.get params[:id]
    end

  end

end
