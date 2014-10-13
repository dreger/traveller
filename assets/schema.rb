# Create a table with this schema, and then run
# sqlite3 {ENV}.db << geolocations_import.sql

create_table "geolocations", id: false, force: true do |t|
  t.string "state"
  t.string "city"
  t.string "zip"
  t.string "latitude"
  t.string "longitude"
end
