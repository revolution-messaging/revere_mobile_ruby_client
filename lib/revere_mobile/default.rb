# frozen_string_literal: true

require 'revere_mobile/version'

module RevereMobile
  module Default
    USERNAME = nil
    PASSWORD = nil
    API_KEY = nil
    API_ENDPOINT = 'https://mobile.reverehq.com/api/v1/'
    SHORTCODE_ID = nil
    USER_AGENT = "Revere Mobile Ruby Gem #{RevereMobile::VERSION}"

    class << self
      def username
        USERNAME
      end

      def password
        PASSWORD
      end

      def api_key
        API_KEY
      end

      def api_endpoint
        API_ENDPOINT
      end

      def shortcode_id
        SHORTCODE_ID
      end

      def user_agent
        USER_AGENT
      end
    end
  end
end
