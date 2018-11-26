# frozen_string_literal: true

require 'revere_mobile/connection'
require 'revere_mobile/request'
require 'revere_mobile/response'
require 'revere_mobile/client/authentication'
require 'revere_mobile/client/campaign'
require 'revere_mobile/client/shortcode'
require 'revere_mobile/client/mobile_flow'

module RevereMobile
  class Client
    def initialize(configuration = nil)
      @config = configuration
    end

    def config
      @config || RevereMobile.configuration
    end

    include RevereMobile::Connection
    include RevereMobile::Request
    include RevereMobile::Response
    include RevereMobile::Client::Authentication
    include RevereMobile::Client::Campaign
    include RevereMobile::Client::Shortcode
    include RevereMobile::Client::MobileFlow
  end
end
