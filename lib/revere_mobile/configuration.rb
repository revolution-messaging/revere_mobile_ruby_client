# frozen_string_literal: true

require 'revere_mobile/default'
require 'revere_mobile/version'

module RevereMobile
  class Configuration
    # The Revere Mobile Username
    #
    # The `username` setting is used for authenticating requests.
    #
    # @return [String, nil]
    attr_accessor :username

    # The Revere Mobile Password
    #
    # The `password` setting is used for authenticating requests.
    #
    # @return [String, nil]
    attr_accessor :password

    # The Revere Mobile Shortcode Session
    #
    # The `shortcode_id` setting is used for changing the shortcode session.
    # Most accounts will have access to only one of these.
    #
    # @return [String, nil]
    attr_accessor :shortcode_id

    # The API Endpoint url. Which endpoint you should use is determined by which
    # version with which you're working.
    # Some features may be require to use multiple versions of the endpoint
    # and thus you may want to change this configuration.
    # @note See https://mobile-developers.reverehq.com
    # @return [String]
    attr_accessor :api_endpoint

    # The User-Agent sent to the API endpoint. This defaults to the gem name,
    # suffixed with the current version number.
    # @return [String]
    attr_accessor :user_agent

    def initialize
      setup
    end

    # Reset all configuration to default values.
    # @return [RevereMobile::Configuration]
    def reset!
      @username = RevereMobile::Default.username
      @password = RevereMobile::Default.password
      @shortcode_id = RevereMobile::Default.shortcode_id
      @api_endpoint = RevereMobile::Default.api_endpoint
      @user_agent = RevereMobile::Default.user_agent
      self
    end

    alias setup reset!

    # Inspect the configuration object, masking private values.
    # @return [String]
    def inspect
      inspected = super

      if RevereMobile.configuration.password
        filter_value!(inspected, RevereMobile.configuration.password)
      end

      inspected
    end

    private

    def filter_value!(source, str)
      source.gsub!(str, '[FILTERED]')
    end
  end
end
