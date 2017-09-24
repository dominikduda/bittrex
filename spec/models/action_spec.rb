require 'spec_helper'

describe Bittrex::Action do
  let(:response) { fixture(:action) }
  let(:attrs) { response.merge({ 'uuid' => 'aaaaaa-bbbbbbb-ccccccc-ddddd' }) }
  let(:subject) { Bittrex::Action.new(attrs, response) }

  describe '#initialization' do
    it { should_assign_attribute(subject, :success, 'true') }
    it { should_assign_attribute(subject, :raw, response) }
    it { should_assign_attribute(subject, :uuid, 'aaaaaa-bbbbbbb-ccccccc-ddddd') }
  end
end
