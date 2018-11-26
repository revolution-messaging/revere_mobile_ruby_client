# frozen_string_literal: true

module RevereMobile
  class Client
    module MobileFlow
      def mobileflows(params:{})
        get(path: 'mobileflow', params: params)
      end
    end
  end
end
