module TimeTrackerFx

  class Organization
    include DataMapper::Resource

    has n, :associates, :constraint => :destroy
    has n, :projects, :constraint => :destroy

    property :id, Serial
    property :created_at, DateTime

    property :name, String, :required => true, :unique => true
    property :description, Text
    property :address_1, String
    property :address_2, String
    property :city, String
    property :state, String
    property :zip, String
  end

end
