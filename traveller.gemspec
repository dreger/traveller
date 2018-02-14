Gem::Specification.new do |s|
  s.name        = 'traveller'
  s.version     = '0.0.009'
  s.date        = '2014-10-30'
  s.summary     = "Find that location."
  s.description = "Traveller parses location-based strings and exposes their city, state, zip code, latitude, and longitude. NOTE: Latitude and Longitude support is coming."
  s.authors     = ["K.Q. Dreger"]
  s.email       = 'comments@dreger.me'
  s.files       = ["lib/traveller.rb"]
  s.homepage    =
    'https://github.com/dreger/traveller'
  s.license       = 'MIT'
  s.add_development_dependency "rspec"
end
