# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "eztz/version"

Gem::Specification.new do |spec|
  spec.name = "eztz"
  spec.version = Eztz::VERSION
  spec.authors = ["Chris Mason"]
  spec.email = ["chris@chaione.com"]

  spec.summary = "Ruby wrapper for the Google Time Zone API"
  spec.description = spec.summary
  spec.homepage = "https://github.com/cmason/eztz"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = Gem::Requirement.new(">= 2.7")

  spec.add_dependency "base64"
  spec.add_dependency "bigdecimal"
  spec.add_development_dependency "bundler", ">= 2.2.33"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "mutex_m"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rubycritic"
  spec.add_development_dependency "simplecov", ">= 0.22.0"
  spec.add_development_dependency "standard"
  spec.add_development_dependency "webmock"
end
