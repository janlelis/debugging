# -*- encoding: utf-8 -*-

require File.expand_path('../lib/debugging/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "debugging"
  gem.version       = Debugging::VERSION
  gem.summary       = 'Print debugging helpers'
  gem.description   = 'Utilities for better "print debugging"'
  gem.license       = "MIT"
  gem.authors       = ["Jan Lelis"]
  gem.email         = ["hi@ruby.consulting"]
  gem.homepage      = "https://github.com/janlelis/debugging"

  gem.files         = Dir['{**/}{.*,*}'].select { |path| File.file?(path) && path !~ /pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.metadata      = { "rubygems_mfa_required" => "true" }

  gem.required_ruby_version = '>= 2.0', '< 4.0'

  gem.add_dependency 'paint', '>= 0.9', '< 3.0'

  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_development_dependency 'rspec', '~> 2.99'
end
