# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-sfdc-background/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-sfdc-background'
  spec.version       = OmniAuth::SfdcBackground::VERSION
  spec.authors       = ['Chulki Lee']
  spec.email         = %w[chulki@asperasoft.com]
  spec.description   = 'OmniAuth strategy for logging in Salesforce in your app'
  spec.summary       = 'OmniAuth strategy for logging in Salesforce in your app'
  spec.homepage      = 'https://github.com/chulkilee/omniauth-sfdc-background'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency 'omniauth', '>= 1.1'
  spec.add_runtime_dependency 'restforce', '>= 1.3.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'simplecov'
end
