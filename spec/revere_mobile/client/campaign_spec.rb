# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  class Client
    RSpec.describe Campaign do
      let(:client) { RevereMobile::Client.new }

      describe "#campaigns" do
        let(:params) { Hash.new }
        let(:response) { fixture('get_all_campaigns.json') }
        let(:url) { build_url(client: client, path: 'campaign') }

        before do
          stub_request(:get, url)
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.campaigns(params: params)
          expect(
            a_request(:get, url)
              .with(query: params)
          ).to have_been_made
        end

        it 'returns the campaigns' do
          campaigns = client.campaigns(
            params: params)
          expect(campaigns['collection']).to be_a(Array)
        end

        it 'returns the campaigns with details' do
          campaigns = client.campaigns(
            params: params)
          campaign = campaigns['collection'].first
          expect(campaign['id']).not_to be_empty
          expect(campaign['account']).not_to be_empty
        end
      end
    end
  end
end
