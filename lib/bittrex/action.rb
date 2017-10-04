module Bittrex
  class Action
    attr_reader :raw, :success, :uuid

    def initialize(attrs = {}, response = {})
      @uuid = attrs['uuid']
      @success = attrs['success']
      @raw = response
    end

    def self.cancel_order(uuid)
      response = client.get('market/cancel', uuid: uuid)
      attrs = response
      attrs['uuid'] = uuid
      new(attrs, response)
    end

    def self.sell_limit_order(market, quantity, rate)
      response = client.get('market/selllimit', market: market, quantity: quantity, rate: rate)
      attrs = response['result'] || {}
      attrs['success'] = response['success']
      new(attrs, response)
    end

    def self.buy_limit_order(market, quantity, rate)
      response = client.get('market/buylimit', market: market, quantity: quantity, rate: rate)
      attrs = response['result'] || {}
      attrs['success'] = response['success']
      new(attrs, response)
    end

    def self.client
      @client ||= Bittrex.client
    end
  end
end
