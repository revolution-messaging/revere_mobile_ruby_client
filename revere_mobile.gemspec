# encoding: UTF-8
# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'revere_mobile/version'

Gem::Specification.new do |s|
  s.name        = 'revere_mobile'
  s.version     = RevereMobile::VERSION
  s.authors     = ['Samuel Robertson']
  s.email       = ['samuel.robertson93@gmail.com']
  s.homepage    = 'https://github.com/revolution-messaging/revere_mobile_ruby_client'

  s.summary     = 'A wrapper for Revere Mobile API. Visit https://revolutionmessaging.com/revere/mobile/ for more information.'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = `git ls-files lib spec README.md`.split($INPUT_RECORD_SEPARATOR)
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.1.0'

  s.add_dependency 'faraday', '~> 0.15.3'
  s.add_dependency 'faraday-cookie_jar', '~> 0.0.6'
  s.add_dependency 'faraday_middleware', '~> 0.12.2'
  s.add_dependency 'multi_json', '~>1.11', '>= 1.11.0'

  s.add_development_dependency 'faker', '~> 1.9.1', '>= 1.9.1'
  s.add_development_dependency 'rake', '~> 12.3.1', '>= 12.3.1'
  s.add_development_dependency 'rspec', '~> 3.8.0', '>= 3.8.0'
  s.add_development_dependency 'simplecov', '~> 0.16.1', '>= 0.16.1'
  s.add_development_dependency 'webmock', '~> 3.4.2', '>= 3.4.2'
  s.add_development_dependency 'awesome_print', '~> 1.8', '>= 1.8'
end
