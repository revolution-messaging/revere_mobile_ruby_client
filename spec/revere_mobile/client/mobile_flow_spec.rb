# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  class Client
    RSpec.describe MobileFlow do
      let(:client) { RevereMobile::Client.new }

      describe "#mobileflows" do
        let(:params) { Hash.new }
        let(:response) { fixture('mobile_flows/get_all_mobile_flows.json') }
        let(:url) { build_url(client: client, path: 'mobileflow') }

        before do
          stub_request(:get, url)
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.mobileflows(params: params)
          expect(
            a_request(:get, url)
              .with(query: params)
          ).to have_been_made
        end

        it 'returns the mobileflows' do
          mobileflows = client.mobileflows(
            params: params)
          expect(mobileflows['collection']).to be_a(Array)
        end

        it 'returns the mobileflows with details' do
          mobileflows = client.mobileflows(
            params: params)
          mobileflow = mobileflows['collection'].first
          expect(mobileflow['id']).not_to be_empty
          expect(mobileflow['campaign']).not_to be_empty
          expect(mobileflow['shortCode']).not_to be_empty
          expect(mobileflow['name']).not_to be_empty
          expect(mobileflow['lists']).not_to be_empty
          expect(mobileflow['lists']).to be_a(Array)
        end
      end
    end
  end
end
