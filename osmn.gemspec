# -*- encoding: utf-8 -*-
require File.expand_path('../lib/osmn/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'osmn'
  gem.version     = OSMN::VERSION
  gem.authors     = ["Jorge Kalmbach"]
  gem.email       = "kalmbach@gmail.com"
  gem.description = "A Ruby wrapper for the OpenStreetMap Nominatim API."
  gem.summary     = "A Ruby wrapper for the OpenStreetMap Nominatim API."
  gem.homepage    = "http://github.com/kalmbach/osmn"

  gem.files       = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

#  gem.test_files    = ["test/test_osmn.rb"]
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest"
end
