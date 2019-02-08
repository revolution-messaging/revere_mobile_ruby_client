# frozen_string_literal: true

require 'spec_helper'

module RevereMobile
  RSpec.describe Request do
    let(:client) { RevereMobile::Client.new }
    let(:params) { { id: 1 } }

    describe '#get' do
      let(:url) { build_url(client: client, path: '/mobile/resource') }

      context 'when making a request' do
        before do
          stub_request(:get, url)
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'makes a get request' do
          RevereMobile.get(path:'/mobile/resource')
          expect(a_request(:get, url)).to have_been_made
        end
      end

      context 'when passing parameters to the request' do
        before do
          stub_request(:get, url).with(query: params)
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'passes params with the request' do
          RevereMobile.get(path: '/mobile/resource', params: params)
          expect(a_request(:get, url).with(query: params)).to have_been_made
        end
      end
    end

    describe '#post' do
      let(:url) { build_url(client: client, path: '/some/resource') }
      let(:body) do
        {
          username: 'Test Username',
          password: 'Test Password',
        }
      end

      context 'when making a request' do
        before do
          stub_request(:post, url)
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'makes a post request' do
          RevereMobile.post(path: '/some/resource')
          expect(a_request(:post, url)).to have_been_made
        end
      end

      context 'when passing a body to the request' do
        before do
          stub_request(:post, url).with(body: JSON.generate(body))
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'makes a post request with a body' do
          RevereMobile.post(path: '/some/resource', body: body)
          expect(a_request(:post, url).with(body: body)).to have_been_made
        end
      end
    end

    describe '#put' do
      let(:url) { build_url(client: client, path: '/some/resource') }
      let(:body) do
        {
          name: 'Test List'
        }
      end

      context 'when making a put request' do
        before do
          stub_request(:put, url)
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'makes a put request' do
          RevereMobile.put(path: '/some/resource')
          expect(a_request(:put, url)).to have_been_made
        end
      end

      context 'when making a put request with a body' do
        before do
          stub_request(:put, url).with(body: JSON.generate(body))
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'makes a put request with the body' do
          RevereMobile.put(path: '/some/resource', body: body)
          expect(a_request(:put, url).with(body: body)).to have_been_made
        end
      end
    end

    context '#delete' do
      let(:url) { build_url(client: client, path: '/mobile/resource') }

      context 'when making a request' do
        before do
          stub_request(:delete, url)
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'makes a get request' do
          RevereMobile.delete(path:'/mobile/resource')
          expect(a_request(:delete, url)).to have_been_made
        end
      end

      context 'when passing parameters to the request' do
        before do
          stub_request(:delete, url).with(query: params)
          .to_return(
            :headers => { 'Set-Cookie' => 'TestCookie;' }
          )
        end

        it 'passes params with the request' do
          RevereMobile.delete(path: '/mobile/resource', params: params)
          expect(a_request(:delete, url).with(query: params)).to have_been_made
        end
      end
    end
  end
end
