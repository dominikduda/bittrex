module Bittrex
  class Action
    attr_reader :uuid, :raw

    def initialize(attrs = {})
      @uuid = attrs['uuid']
      @raw = attrs
    end

    def self.cancel_order(uuid)
      client.get('market/cancel', uuid: uuid)
    end

    private

    def self.client
      @client ||= Bittrex.client
    end
  end
end
