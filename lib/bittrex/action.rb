module Bittrex
  class Action
    attr_reader :raw, :result, :uuid

    def initialize(attrs = {}, custom_attrs = {})
      @uuid = custom_attrs[:uuid]
      @result = attrs['result']
      @raw = attrs
    end

    def self.cancel_order(uuid)
      attrs = client.get('market/cancel')
      custom_attrs = { uuid: uuid }
      new(attrs, custom_attrs)
    end

    private

    def self.client
      @client ||= Bittrex.client
    end
  end
end
