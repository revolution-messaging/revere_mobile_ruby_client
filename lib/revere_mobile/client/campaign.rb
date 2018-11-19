# frozen_string_literal: true

module RevereMobile
  class Client
    module Campaign
      def campaigns(params:{})
        get(path: 'campaign', params: params)
      end
    end
  end
end
