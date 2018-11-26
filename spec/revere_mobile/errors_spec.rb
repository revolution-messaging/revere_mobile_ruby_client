# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  RSpec.describe RevereMobile::Error do
    let(:client) { RevereMobile::Client.new }

    context 'when a resource is not found' do
      let(:url) { build_url(client: client, path: '/nowhere') }

      before do
        stub_request(:get, url)
        .to_return(status: 404)
      end

      it 'rasies the RevereMobile::NotFound' do
        expect {
          client.get(path: '/nowhere')
        }.to raise_error(RevereMobile::NotFound)
      end
    end

    context 'when a bad request is made' do
      let(:url) { build_url(client: client, path: '/badrequest') }

      before do
        stub_request(:get, url)
        .to_return(status: 400)
      end

      it 'rasies the RevereMobile::BadRequest' do
        expect {
          client.get(path: '/badrequest')
        }.to raise_error(RevereMobile::BadRequest)
      end
    end

    context 'when an unkown bad request is made' do
      let(:url) { build_url(client: client, path: '/badrequest') }

      before do
        stub_request(:get, url)
        .to_return(status: 455)
      end

      it 'rasies the RevereMobile::ClientError' do
        expect {
          client.get(path: '/badrequest')
        }.to raise_error(RevereMobile::ClientError)
      end
    end

    context 'when a server error ocurs' do
      let(:url) { build_url(client: client, path: '/serverError') }

      before do
        stub_request(:get, url)
        .to_return(status: 500)
      end

      it 'rasies the RevereMobile::InternalServerError' do
        expect {
          client.get(path: '/serverError')
        }.to raise_error(RevereMobile::InternalServerError)
      end
    end

    context 'when an unknown server error ocurs' do
      let(:url) { build_url(client: client, path: '/serverError') }

      before do
        stub_request(:get, url)
        .to_return(status: 555)
      end

      it 'rasies the RevereMobile::ServerError' do
        expect {
          client.get(path: '/serverError')
        }.to raise_error(RevereMobile::ServerError)
      end
    end
  end
end
