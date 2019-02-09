# frozen_string_literal: true

require 'faraday-cookie_jar'
require 'awesome_print'

module RevereMobile
  class Client
    module Authentication
      def login

        temp_cookie_jar = HTTP::CookieJar.new

        conn = Faraday.new(url: config.api_endpoint) do |f|
          f.use :cookie_jar, jar: temp_cookie_jar
          f.adapter Faraday.default_adapter
        end

        response = conn.post do |req|
          req.url 'authenticate'
          req.headers['Content-Type'] = 'application/json'
          req.body = JSON.generate({ username: config.username, password: config.password })
        end


        config.session = temp_cookie_jar
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
