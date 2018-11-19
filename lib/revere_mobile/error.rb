# frozen_string_literal: true

module RevereMobile
  class Error < StandardError
    attr_reader :body
    attr_reader :response
    attr_reader :status
    attr_reader :errors

    # Returns a RevereMobile::Error subclass, depending on status and
    # response message.
    #
    # @param [Hash] response HTTP response
    # @return [RevereMobile::Error]
    def self.from_response(response)
      status = response[:status].to_i

      error_klass =
        case status
        when 400 then RevereMobile::BadRequest
        when 401 then RevereMobile::Unauthorized
        when 403 then RevereMobile::Forbidden
        when 405 then RevereMobile::MethodNotAllowed
        when 406 then RevereMobile::NotAcceptable
        when 408 then RevereMobile::RequestTimeout
        when 409 then RevereMobile::Conflict
        when 413 then RevereMobile::RequestEntityTooLarge
        when 415 then RevereMobile::UnsupportedMediaType
        when 422 then RevereMobile::UnprocessableEntity
        when 429 then RevereMobile::TooManyRequests
        when 404 then RevereMobile::NotFound
        when 400..499 then RevereMobile::ClientError
        when 500 then RevereMobile::InternalServerError
        when 501 then RevereMobile::NotImplemented
        when 502 then RevereMobile::BadGateway
        when 503 then RevereMobile::ServiceUnavailable
        when 504 then RevereMobile::GatewayTimeout
        when 500..599 then RevereMobile::ServerError
        end

      error_klass.new(response) if error_klass
    end

    def initialize(response = nil)
      @response = response
      @body = response[:body]
      @status = response[:status]
      @errors = body.delete('errors')

      super(build_error)
    end

    private

    def build_error
      return nil if response.nil?

      {
        status: status,
        errors: errors
      }
    end
  end

  # Errors in the 400-499 range
  class ClientError < Error; end

  # 400 Bad request
  class BadRequest < ClientError; end

  # 401 Unauthorized
  class Unauthorized < ClientError; end

  # 403 Forbidden
  class Forbidden < ClientError; end

  # 404 Not found
  class NotFound < ClientError; end

  # 405 Method not allowed
  class MethodNotAllowed < ClientError; end

  # 406 Not acceptable
  class NotAcceptable < ClientError; end

  # 408 Request timeout
  class RequestTimeout < ClientError; end

  # 409 Conflict
  class Conflict < ClientError; end

  # 413 Request entity too large
  class RequestEntityTooLarge < ClientError; end

  # 415 Unsupported media type
  class UnsupportedMediaType < ClientError; end

  # 422 Unprocessable entity
  class UnprocessableEntity < ClientError; end

  # 429 Too many requests
  class TooManyRequests < ClientError; end

  # Errors in the 500-599 range
  class ServerError < Error; end

  # 500 Internal server error
  class InternalServerError < ServerError; end

  # 501 Not implemented
  class NotImplemented < ServerError; end

  # 502 Bad gateway
  class BadGateway < ServerError; end

  # 503 Service unavailable
  class ServiceUnavailable < ServerError; end

  # 504 Gateway timeout
  class GatewayTimeout < ServerError; end
end
