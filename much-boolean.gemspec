# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "much-boolean/version"

Gem::Specification.new do |gem|
  gem.name        = "much-boolean"
  gem.version     = MuchBoolean::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com "]
  gem.summary     = "An API for friendly boolean conversion, interpretation and handling"
  gem.description = "An API for friendly boolean conversion, interpretation and handling"
  gem.homepage    = "https://github.com/redding/much-boolean"
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("assert", ["~> 2.16.1"])

end
