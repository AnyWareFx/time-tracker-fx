module TimeTrackerFx

  class TimeSheet
    include DataMapper::Resource

    belongs_to :consultant

    has n, :entries, 'TimeSheetEntry', :constraint => :destroy

    property :id, Serial
    property :created_at, DateTime

    property :year, Integer
    property :week, Integer, :min => 1, :max => 52
    property :start_date, Date
    property :end_date, Date
    property :hours, Integer, :min => 0, :max => 50
    property :status, Enum[:open, :submitted, :approved]
  end


  class TimeSheetEntry
    include DataMapper::Resource

    belongs_to :time_sheet
    belongs_to :story_task

    property :id, Serial
    property :created_at, DateTime

    property :date, Date
    property :start_time, Time
    property :end_time, Time
    property :hours, Decimal, precision: 4, scale: 2
  end

end
