# frozen_string_literal: true

require 'json'

module RevereMobile
  module Request
    # Perform an HTTP GET request
    def get(path:, params: {})
      request(method: :get, path: path, params: params)
    end

    # Perform an HTTP POST request
    def post(path:, body: {})
      request(method: :post, path: path, body: body)
    end

    # Perform an HTTP PUT request
    def put(path:, body: {})
      request(method: :put, path: path, body: body)
    end

    # Perform an HTTP DELETE request
    def delete(path:, params: {})
      request(method: :delete, path: path, params: params)
    end

    private

    def request(method:, path:, params: {}, body: {})
      response = connection.send(method) do |request|
        request.path = URI.encode(path)
        request.params = params
        request.body = ::JSON.generate(body) unless body.empty?
      end

      Response.create(response.body)
    end
  end
end
