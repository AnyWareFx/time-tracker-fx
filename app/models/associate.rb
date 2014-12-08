module TimeTrackerFx

  class Associate
    include DataMapper::Resource

    belongs_to :organization
    has n, :project_associates
    has n, :projects, :through => :project_associates

    property :id, Serial
    property :created_at, DateTime
    property :type, Discriminator

    property :prefix, String
    property :first_name, String
    property :middle_name, String
    property :last_name, String
    property :suffix, String
    property :email, String
    property :phone, String
  end


  class Consultant < Associate
    has n, :time_sheets
    has n, :tasks, 'ConsultantStoryTask'

    property :rate, Decimal, precision: 6, scale: 2
  end


  class ConsultantStoryTask
    include DataMapper::Resource

    belongs_to :consultant
    belongs_to :story_task

    property :id, Serial
    property :created_at, DateTime
    property :estimated_hours, Integer
    property :actual_hours, Decimal, precision: 5, scale: 2
  end

end
