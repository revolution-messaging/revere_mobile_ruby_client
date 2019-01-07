# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  class Client
    RSpec.describe Campaign do
      let(:client) { RevereMobile::Client.new }

      describe '#campaigns' do
        let(:params) { Hash.new }
        let(:response) { fixture('campaigns/get_all_campaigns.json') }
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

      describe '#create_campaign' do
        let(:params) { Hash.new name: 'Test Campaign' }
        let(:response) { fixture('campaigns/create_campaign.json') }
        let(:url) { build_url(client: client, path: 'campaign') }

        before do
          stub_request(:post, url)
            .with(body: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.create_campaign(params)
          expect(
            a_request(:post, url)
              .with(body: params)
          ).to have_been_made
        end

        it 'returns the created campaign' do
          campaign = client.create_campaign(params)
          expect(campaign['id']).not_to be_empty
          expect(campaign['name']).to eq('Test Campaign')
          expect(campaign['startDate']).not_to be_empty
          expect(campaign['mobileFlows']).to be_a(Array)
        end
      end
      describe '#update_campaign' do
        let(:params) { { id: '5493568f0cb2fcad2e35ecb5', name: 'Test Campaign' } }
        let(:url) { build_url(client: client, path: 'campaign/5493568f0cb2fcad2e35ecb5') }

        before do
          stub_request(:put, url)
            .with(body: params)
            .to_return(
              status: 204
            )
        end

        it 'requests the correct resource' do
          client.update_campaign(params)
          expect(
            a_request(:put, url)
              .with(body: params)
          ).to have_been_made
        end

        it 'returns with with an empty string' do
          # Revere Mobile comes back with No Content here
          response = client.update_campaign(params)
          expect(
            response
          ).to eq('')
        end
      end
    end
  end
end
