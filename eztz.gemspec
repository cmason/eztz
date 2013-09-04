# -*- encoding: utf-8 -*-
require File.expand_path('../lib/eztz/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "eztz"
  gem.authors       = ["Chris Mason"]
  gem.email         = ["chris@chaione.com"]
  gem.description   = %q{Ruby wrapper for the Google Time Zone API}
  gem.license       = 'MIT'
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/cmason/eztz"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = Eztz::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '~> 2.12.0'
  gem.add_development_dependency 'vcr', '~> 2.4.0'
  gem.add_development_dependency 'webmock', '~> 1.9.3'

  gem.add_dependency 'httparty', '~> 0.10'
  gem.add_dependency 'hashie', '>= 1.2.0'
end
