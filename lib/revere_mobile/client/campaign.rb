# frozen_string_literal: true

module RevereMobile
  class Client
    module Campaign
      def campaigns(params = { size: RevereMobile::Default.query_size })
        get(path: 'campaign', params: params)
      end

      def create_campaign(body = {})
        post(path: 'campaign', body: body)
      end

      def update_campaign(body = {})
        put(path: "campaign/#{body[:id]}", body: body)
      end
    end
  end
end
