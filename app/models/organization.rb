module TimeTrackerFx

  class Organization
    include DataMapper::Resource

    has n, :associates
    has n, :projects

    property :id, Serial
    property :created_at, DateTime

    property :name, String
    property :description, Text
    property :address_1, String
    property :address_2, String
    property :city, String
    property :state, String
    property :zip, String
  end

end
