require 'rails_helper'

RSpec.describe Salesforce::SyncDealers, type: :model do
  let(:subject) { described_class }

  it 'returns success when fetching and saving dealers from salesforce worked out' do
    VCR.use_cassette('Salesforce fetch dealers') do
      result = subject.invoke
      expect(result).to be_success
    end
  end
end
