Gem::Specification.new do |s|
  s.name        = 'traveller'
  s.version     = '0.0.001'
  s.date        = '2014-10-08'
  s.summary     = "Find that location."
  s.description = "Wanderer parses location-based strings and exposes their city, state, zip code, latitude, and longitude."
  s.authors     = ["Kyle Dreger"]
  s.email       = 'dregerkq@mountunion.edu'
  s.files       = ["lib/wanderer.rb"]
  s.homepage    =
    'https://github.com/kyledreger/traveller'
  s.license       = 'MIT'
  s.add_development_dependency "rspec"
end

