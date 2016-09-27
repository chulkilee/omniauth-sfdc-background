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

  spec.files         = Dir['lib/**/*']
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency 'omniauth', '>= 1.1'
  spec.add_runtime_dependency 'restforce', '>= 1.3.0'
end
