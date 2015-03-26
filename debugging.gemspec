# -*- encoding: utf-8 -*-

require File.expand_path('../lib/debugging/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "debugging"
  gem.version       = Debugging::VERSION
  gem.summary       = 'Print debugging helpers.'
  gem.description   = 'Provides useful print debugging helpers.'
  gem.license       = "MIT"
  gem.authors       = ["Jan Lelis"]
  gem.email         = "mail@janlelis.de"
  gem.homepage      = "https://github.com/janlelis/debugging"

  gem.files         = Dir['{**/}{.*,*}'].select { |path| File.file?(path) && path !~ /pkg/ }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.required_ruby_version = '~> 2.0'

  gem.add_dependency 'paint', '>= 0.9', '< 2.0'
  gem.add_dependency 'binding.repl', '~> 3.0'

  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 10.1'
  gem.add_development_dependency 'rdoc', '~> 3.0'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
end
