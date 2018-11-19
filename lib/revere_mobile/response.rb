# frozen_string_literal: true

module RevereMobile
  module Response
    def self.create(body)
      JSON.parse(body)
    # The Mobile API does not always return JSON. For cases like this, we
    # will just return the body un-parsed.
    rescue JSON::ParserError
      body
    end
  end
end
