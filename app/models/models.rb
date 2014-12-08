
%w(associate organization project story time_sheet).each do |model|
  require "#{Dir.pwd}/app/models/#{model}"
end


