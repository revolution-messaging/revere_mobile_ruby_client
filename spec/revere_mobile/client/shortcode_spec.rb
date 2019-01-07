# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  class Client
    RSpec.describe Shortcode do
      let(:client) { RevereMobile::Client.new }

      describe "#shortcodes" do
        let(:params) { Hash.new }
        let(:response) { fixture('shortcodes/get_all_shortcodes.json') }
        let(:url) { build_url(client: client, path: 'shortcode') }

        before do
          stub_request(:get, url)
            .with(query: params)
            .to_return(
              body: response
            )
        end

        it 'requests the correct resource' do
          client.shortcodes(params: params)
          expect(
            a_request(:get, url)
              .with(query: params)
          ).to have_been_made
        end

        it 'returns the shortcodes' do
          shortcodes = client.shortcodes(
            params: params)
          expect(shortcodes['collection']).to be_a(Array)
        end

        it 'returns the shortcodes with details' do
          shortcodes = client.shortcodes(
            params: params)
          shortcode = shortcodes['collection'].first
          expect(shortcode['id']).not_to be_empty
          expect(shortcode['country']).not_to be_empty
          expect(shortcode['status']).not_to be_empty
          expect(shortcode['shortcode']).not_to be_empty
        end
      end
    end
  end
end
