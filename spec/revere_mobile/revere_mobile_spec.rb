require 'spec_helper'

describe "RevereMobile" do
  it 'has a version number equal to 0.1.0' do
    expect(RevereMobile::VERSION).to_not be nil
    expect(RevereMobile::VERSION).to eq('0.1.0')
  end

  describe ".client" do
    it 'creates a new RevereMobile client' do
      expect(RevereMobile.client).to be_instance_of(RevereMobile::Client)
    end

    context 'when @client has been already assigned' do
      it 'returns the @client' do
        client = RevereMobile.client
        expect(RevereMobile.client).to eq(client)
      end
    end
  end
end
