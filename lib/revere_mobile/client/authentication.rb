# frozen_string_literal: true

require 'faraday-cookie_jar'

module RevereMobile
  class Client
    module Authentication
      def login
        conn = Faraday.new(url: config.api_endpoint) { |f| f.use :cookie_jar; f.adapter Faraday.default_adapter; }
        response = conn.post do |req|
          req.url '/api/v1/authenticate'
          req.headers['Content-Type'] = 'application/json'
          req.body = JSON.generate({ username: config.username, password: config.password })
        end
        config.session = response.headers['set-cookie']
        response
      end

      def who_am_i
        get(path: 'authenticate/whoami')
      end

      def logout
        post(path: 'authenticate/logout')
      end
    end
  end
end
