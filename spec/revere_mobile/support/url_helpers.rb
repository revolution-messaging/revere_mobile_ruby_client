# frozen_string_literal: true

def build_url(client:, path:)
  client.send(:connection).build_url(path).to_s
end
