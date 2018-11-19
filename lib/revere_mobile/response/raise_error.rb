# frozen_string_literal: true

require 'revere_mobile/error'
require 'faraday'

module RevereMobile
  module Response
    # Raises erors on Faraday Responses
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        error = RevereMobile::Error.from_response(response)
        raise error if error
      end
    end
  end
end
