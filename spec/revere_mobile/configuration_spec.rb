# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  RSpec.describe Configuration do
    before(:each) { RevereMobile.configuration.reset! }
    after(:each) { RevereMobile.configuration.reset! }

    describe '#api_endpoint' do
      context 'when no api_endpoint is specified' do
        it 'sets a default value' do
          expect(RevereMobile.configuration.api_endpoint)
            .to eq(RevereMobile::Default.api_endpoint)
        end
      end

      context 'when a custom value is supplied' do
        let(:url) { Faker::Internet.url }

        before do
          RevereMobile.configure do |config|
            config.api_endpoint = url
          end
        end

        it 'returns the custom value' do
          expect(RevereMobile.configuration.api_endpoint).to eq(url)
        end
      end
    end

    describe '#username' do
      context 'when no username is specified' do
        it 'sets a default value' do
          expect(RevereMobile.configuration.username)
            .to eq(RevereMobile::Default.username)
        end
      end

      context 'when a custom value is supplied' do
        let(:username) { Faker::Internet.username }

        before do
          RevereMobile.configure do |config|
            config.username = username
          end
        end

        it 'returns the custom value' do
          expect(RevereMobile.configuration.username).to eq(username)
        end
      end
    end

    describe '#user_agent' do
      context 'when no user_agent is specified' do
        it 'sets a default value' do
          expect(RevereMobile.configuration.user_agent)
            .to eq(RevereMobile::Default.user_agent)
        end
      end

      context 'when a custom value is supplied' do
        let(:user_agent) { Faker::Internet.user_agent }

        before do
          RevereMobile.configure do |config|
            config.user_agent = user_agent
          end
        end

        it 'returns the custom value' do
          expect(RevereMobile.configuration.user_agent).to eq(user_agent)
        end
      end
    end

    describe '#shortcode_id' do
      context 'when no shortcode_id is specified' do
        it 'sets a default value' do
          expect(RevereMobile.configuration.shortcode_id)
            .to eq(RevereMobile::Default.shortcode_id)
        end
      end

      context 'when a custom value is supplied' do
        let(:shortcode_id) { Faker::Crypto.md5 }

        before do
          RevereMobile.configure do |config|
            config.shortcode_id = shortcode_id
          end
        end

        it 'returns the custom value' do
          expect(RevereMobile.configuration.shortcode_id).to eq(shortcode_id)
        end
      end
    end

    describe '#inspect' do
      it 'masks the password' do
        password = Faker::Internet.password
        RevereMobile.configuration.password = password
        expect(RevereMobile.configuration.inspect).to_not include(password)
      end
    end
  end
end
