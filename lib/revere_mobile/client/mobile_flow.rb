# frozen_string_literal: true

module RevereMobile
  class Client
    module MobileFlow
      def mobileflows(params:{ size: RevereMobile::Default.query_size })
        get(path: 'mobileflow', params: params)
      end
    end
  end
end
