# Usage

This is an api to utilize REDCAP api with ruby. This Gem requires mechanize as a dependency.
it is based on instructions here http://sburns.org/2013/07/22/intro-to-redcap-api.html

To start:

r = RedcapAPI.new(token, url) # your institution has it's own url, and each project has it's own token

r.get(optional record_id) # returns all records in JSON format or a specific record if specified

## Contributing

1. Fork it ( https://github.com/[my-github-username]/RedcapAPI/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
