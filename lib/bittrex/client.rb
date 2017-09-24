require 'base64'
require 'json'
require 'rest-client'

module Bittrex
  class Client
    HOST = 'https://bittrex.com/api/v1.1'

    attr_reader :key, :secret

    def initialize(attrs = {})
      @key    = attrs[:key]
      @secret = attrs[:secret]
    end

    def get(path, params = {}, headers = {})
      nonce = Time.now.to_i
      params.merge!(nonce: nonce, apikey: key)
      response = if path.include?('public')
                   RestClient.get full_url(path, params)
                 else
                   RestClient.get full_url(path, params), apisign: signature(full_url(path, params))
                 end
      if path.include?('cancel')
        JSON.parse(response.body)
      else
        JSON.parse(response.body)['result']
      end
    end

    private

    def signature(url)
      OpenSSL::HMAC.hexdigest('sha512', secret, url)
    end

    def full_url(path, params)
      url = "#{HOST}/#{path}"
      url.concat('?')
      parsed_params = params.to_a.map { |a| a.join('=') }.join('&')
      url.concat(parsed_params)
      url
    end
  end
end
