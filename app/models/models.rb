
%w(associate story organization project time_sheet).each do |model|
  require "#{Dir.pwd}/app/models/#{model}"
end


