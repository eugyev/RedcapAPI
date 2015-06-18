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
  The backend is based on instructions here http://sburns.org/2013/07/22/intro-to-redcap-api.html
  }
  spec.description   = %q{
    Please see Github Repo and Readme file https://github.com/eugyev/RedcapAPI
  }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "csv"
  spec.add_development_dependency "nokogiri"
  spec.add_dependency "mechanize"
  spec.add_dependency "json"
end
