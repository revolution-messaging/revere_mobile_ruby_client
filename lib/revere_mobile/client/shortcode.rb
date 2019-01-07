# frozen_string_literal: true

module RevereMobile
  class Client
    module Shortcode
      def shortcodes(params: { size: RevereMobile::Default.query_size })
        get(path: 'shortcode', params: params)
      end
    end
  end
end
