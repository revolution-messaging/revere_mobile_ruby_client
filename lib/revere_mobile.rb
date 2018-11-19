# frozen_string_literal: true

require 'faraday'
require 'revere_mobile/client'
require 'revere_mobile/configuration'

module RevereMobile
  class << self
    # The RevereMobile configuration object.
    # @return [RevereMobile::Configuration]
    attr_reader :configuration

    def client
      @client ||= RevereMobile::Client.new
    end

    # Delegate methods called on RevereMobile to the client.
    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end

  # The current configuration.
  # @return [RevereMobile::Configuration]
  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set new configuration
  # @param config [RevereMobile::Configuration]
  def self.configuration=(config)
    @configuration = config
  end

  # Modify the current configuration
  #
  # @yieldparam [RevereMobile::Configuration] config
  # The current RevereMobile config
  #
  # ```
  #  RevereMobile.configure do |config|
  #    config.api_endpoint = 'https://mobile.reverehq.com/api/v1'
  #    config.username = 'example'
  #    config.password = 'example'
  #  end
  # ```
  def self.configure
    yield configuration
  end
end
