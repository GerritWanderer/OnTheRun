require 'rails_helper'

RSpec.describe Salesforce::DeleteDealers, type: :model do
  let(:subject) { described_class }

  it 'returns success when deleting dealers worked out' do
    VCR.use_cassette('Salesforce fetch deleted dealers') do
      result = subject.invoke
      expect(result).to be_success
    end
  end
end
