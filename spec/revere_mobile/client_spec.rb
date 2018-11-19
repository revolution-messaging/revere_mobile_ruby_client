# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  RSpec.describe Client do
    describe 'initialization' do
      describe 'with a specified configuration' do
        let(:config) { RevereMobile::Configuration.new }

        subject { RevereMobile::Client.new(config) }

        it 'should accept and store as config' do
          expect(subject.config).to eq(config)
        end
      end

      describe 'without a specified configuration' do
        it 'should get the default' do
          expect(subject.config).to eq(RevereMobile.configuration)
        end
      end
    end

    describe 'useage' do
      it 'should be possible to a config and use it with the client' do
        configuration = RevereMobile::Configuration.new
        configuration.user_agent = 'Test Agent'
        configuration.username = 'Test Username'
        client = RevereMobile::Client.new(configuration)
        expect(client.config.user_agent).to eq('Test Agent')
        expect(client.config.username).to eq('Test Username')
      end
    end
  end
end
