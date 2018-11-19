# frozen_string_literal: true

require 'revere_mobile/response/raise_error'
require 'faraday_middleware'
require 'faraday-cookie_jar'

module RevereMobile
  module Connection
    private

    def connection
      options = {
        url: config.api_endpoint,
        headers: {
          'Accept' => 'application/json; charset=utf-8',
          'User-Agent ' => config.user_agent,
          'Cookie' => config.session,
          'Authorization' => config.api_key
        }
      }

      Faraday::Connection.new(options) do |connection|
        connection.request(:json)
        connection.use :cookie_jar
        connection.use RevereMobile::Response::RaiseError
        connection.adapter Faraday.default_adapter
      end
    end
  end
end
