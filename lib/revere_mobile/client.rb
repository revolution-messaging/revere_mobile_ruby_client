# frozen_string_literal: true

require 'revere_mobile/connection'
require 'revere_mobile/request'
require 'revere_mobile/response'

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
  end
end
