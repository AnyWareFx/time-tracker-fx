module TimeTrackerFx

  class Project
    include DataMapper::Resource

    belongs_to :organization
    has n, :stories, :constraint => :destroy
    has n, :project_associates, :constraint => :destroy
    has n, :associates, :through => :project_associates

    property :id, Serial
    property :created_at, DateTime

    property :name, String
    property :description, Text
    property :status, Enum[:planning, :development, :production]
  end



  class ProjectAssociate
    include DataMapper::Resource

    belongs_to :project
    belongs_to :associate

    property :id, Serial
    property :created_at, DateTime

    property :start_date, Date
    property :end_date, Date
    property :role, Enum[:admin, :manager, :architect, :developer, :qa, :ux]
  end

end
