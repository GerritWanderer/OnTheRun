require 'rails_helper'

RSpec.describe Salesforce::SyncDealers, type: :model do
  let(:subject) { described_class }

  it 'successfully creates new dealers from salesforce' do
    VCR.use_cassette('Salesforce create dealers', :match_requests_on => [:host, :path]) do
      expect {
        result = subject.invoke
        expect(result).to be_success
      }.to change { Dealer.count }.by(3)
    end
  end

  it 'successfully updates existing dealers with new data from salesforce' do
    VCR.use_cassette('Salesforce update dealers', :match_requests_on => [:host, :path]) do
      subject.invoke
      expect {
        expect {
          result = subject.invoke
          expect(result).to be_success
        }.to change { Dealer.count }.by(0)
      }.to change { Dealer.first.last_migrated_at }
    end
  end

  it 'returns an error when no connection could be established' do
    VCR.use_cassette('Salesforce authorization error', :match_requests_on => [:host, :path]) do
      result = subject.invoke
      expect(result).to be_error
      expect(result.reason).to eq(:salesforce_connection_error)
    end
  end
end
