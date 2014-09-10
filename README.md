# Usage

This is an api to utilize REDCAP api with ruby. This Gem requires mechanize as a dependency.
it is based on instructions here http://sburns.org/2013/07/22/intro-to-redcap-api.html

This gem is still under active development. Please contact me directly with any  questions or suggestions. 
  
To start:

r = RedcapAPI.new(token, url) # your institution has it's own url, and each project has it's own token

r.export(optional params) # returns all records in JSON format, provide additional hash of parameters in you want to override or add any additional RedcapAPI options.

r.export_metadata(optional params) # returns all metadata records in JSON format, provide additional hash of parameters in you want to override or add any additional RedcapAPI options.

r.import(optional params) # imports new records, the 'post' method is likely more helpful as it puts the 'data' in the correct format.

r.api(optional params) # returns the raw data, this allows you to return 'xml' or 'csv' instead of forcing 'json'. Simply override the params. Example r.api({:format => 'xml'}).

r.get(optional record_id) # returns all records in JSON format or a specific record if specified

r.get_fields # returns all fields for that instrument

r.post(data) # this will either update an old record or create a new one. the data should be in form of array of hashes or as a hash (for one item).  dates are accepted in Date class or in strftime('%F') format. 
for example
  data = {name: 'this is a test', field_2: Date.today}
  r.post(data) # creates a new object using the fields above. field names must match those in the existing project
  "{\"count\": 1}" --> indicates the object posted. 

to update an existing record:
data = {record_id: 3, name: 'this is a test to update', field_2: Date.today}
r.post(data) # this will update the record with record_id 3. if record_id 3 does not exist it will create an entry with that record id

## Contributing

1. Fork it ( https://github.com/[my-github-username]/RedcapAPI/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
