# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'RedcapAPI/version'

Gem::Specification.new do |spec|
  spec.name          = "RedcapAPI"
  spec.version       = RedcapAPI::VERSION
  spec.authors       = ["eugyev"]
  spec.email         = ["eugyev@gmail.com"]
  spec.summary       = %q{This is an api to utilize REDCAP api with ruby. This Gem requires mechanize as a dependency.
  it is based on instructions here http://sburns.org/2013/07/22/intro-to-redcap-api.html
  }
  spec.description   = %q{
    This gem is still under active development. Please contact me directly with any  questions or suggestions. 
    
  To start:

  r = RedcapAPI.new(token, url) # your institution has it's own url, and each project has it's own token

  r.get(optional record_id) # returns all records in JSON format or a specific record if specified
  
  r.get_fields # returns all fields for that instrument
  
  r.post(data) # this will either update an old record or create a new one. the data should be in form of array of hashes or as a hash (for one item).  dates are accepted in Date class or in strftime('%F') format. 
  }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mechanize"
end
