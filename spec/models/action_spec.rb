require 'spec_helper'

describe Bittrex::Action do
  let(:data) { fixture(:action) }
  let(:custom_data) { { uuid: 'aaaaaa-bbbbbbb-ccccccc-ddddd' } }
  let(:subject) { Bittrex::Action.new(data, custom_data) }

  describe '#initialization' do
    it { should_assign_attribute(subject, :result, 'success') }
    it { should_assign_attribute(subject, :raw, data) }
    it { should_assign_attribute(subject, :uuid, 'aaaaaa-bbbbbbb-ccccccc-ddddd') }
  end
end
