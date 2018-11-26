require 'rubygems'
require 'bundler'
require 'revere_mobile/support/webmock'
require 'revere_mobile/support/url_helpers'
require 'revere_mobile/support/path_helpers'

require 'simplecov'
SimpleCov.start

Bundler.setup(:default, :development)

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'faker'
require 'revere_mobile'

RSpec.configure do |config|
  config.color = true
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
