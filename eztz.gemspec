# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eztz/version'

Gem::Specification.new do |spec|
  spec.name          = 'eztz'
  spec.version       = Eztz::VERSION
  spec.authors       = ['Chris Mason']
  spec.email         = ['chris@chaione.com']

  spec.summary       = 'Ruby wrapper for the Google Time Zone API'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/cmason/eztz'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'rubocop', '~> 0.47'
  spec.add_development_dependency 'webmock', '~> 2.3'
end
