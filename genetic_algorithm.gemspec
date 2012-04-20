# -*- encoding: utf-8 -*-
require File.expand_path('../lib/genetic_algorithm', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Craig Russell"]
  gem.email         = ["craig@craig-russell.co.uk"]
  gem.description   = %q{A genetic algorithm framework}
  gem.summary       = %q{A genetic algorithm framework}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "genetic_algorithm"
  gem.require_paths = ["lib"]
  gem.version       = GeneticAlgorithm::VERSION
end
