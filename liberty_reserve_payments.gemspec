# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liberty_reserve_payments/version'

Gem::Specification.new do |gem|
  gem.name          = 'liberty_reserve_payments'
  gem.version       = LibertyReservePayments::VERSION
  gem.authors       = ['Patricio Cano']
  gem.email         = %w(suprnova32@gmail.com)
  gem.description   = %q{Accept payments from Liberty Reserve}
  gem.summary       = %q{You can accept payments from Liberty Reserve and have them validated, so you can activate
                        digital items immediately.}
  gem.homepage      = 'http://github.com/FreedomVPN/liberty_reserve_payments'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency 'rspec-rails'
  gem.add_dependency 'httparty', '>= 0.9.0'
  gem.add_dependency 'rails', '>= 3.2.12'
end
