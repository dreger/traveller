Gem::Specification.new do |s|
  s.name        = 'traveller'
  s.version     = '0.0.007'
  s.date        = '2014-10-30'
  s.summary     = "Find that location."
  s.description = "Traveller parses location-based strings and exposes their city, state, zip code, latitude, and longitude. NOTE: Latitude and Longitude support is coming."
  s.authors     = ["Kyle Dreger"]
  s.email       = 'dregerkq@mountunion.edu'
  s.files       = ["lib/traveller.rb"]
  s.homepage    =
    'https://github.com/kyledreger/traveller'
  s.license       = 'MIT'
  s.add_development_dependency "rspec"
end
