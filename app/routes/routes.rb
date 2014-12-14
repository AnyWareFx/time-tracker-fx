module TimeTrackerFx

  class Routes < Sinatra::Base

    before do
      content_type 'application/json'

      env['PATH_INFO'].sub! /^\/api/, ''
    end


    protected

    def create(model, location)
      data = JSON.parse request.body.read
      model.attributes = data
      if model.save
        headers 'location' => location + model.id.to_s
        status 201
      else
        errs = {:errors => model.errors.to_h}
        body errs.to_json
        status 412
      end
    end

    def lookup(model)
      if model
        model.to_json
      else
        status 404
      end
    end

    def update(model)
      if model
        data = JSON.parse request.body.read
        model.attributes = data
        if model.save
          status 200
        else
          errs = {:errors => model.errors.to_h}
          body errs.to_json
          status 412
        end
      else
        status 404
      end
    end

    def destroy(model)
      if model
        unless model.destroy
          errs = {:errors => model.errors.to_h}
          body errs.to_json
          status 412
        end
      else
        status 404
      end
    end

  end

end
