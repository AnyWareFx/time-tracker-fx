module TimeTrackerFx

  class Story
    include DataMapper::Resource

    belongs_to :project
    has n, :tasks, 'StoryTask'

    property :id, Serial
    property :created_at, DateTime

    property :name, String
    property :description, Text
    property :level_of_effort, Enum[:small, :medium, :large]
    property :status, Enum[:pending, :development, :test, :done, :production]
  end


  class StoryTask
    include DataMapper::Resource

    belongs_to :story
    has n, :entries, 'TimeSheetEntry'

    property :id, Serial
    property :created_at, DateTime
    property :name, String
    property :description, Text
    property :status, Enum[:pending, :wip, :done]
  end

end
