require 'rails_helper'

RSpec.describe Dealers::CreateOrUpdateFromSource, type: :model do
  let(:subject) { described_class }
  let(:params) do
    return {
      name: 'Sportcheck',
      street: 'On Street 1',
      zip_code: '12345',
      city: 'Zürich',
      country: 'ch',
      state: nil,
      phone: '+44 1234567890',
      lat: '99.0',
      lon: '99.0',
      source_id: '1234567890',
      source: Salesforce::SOURCE,
      last_migrated_at: DateTime.now
    }
  end

  it 'returns success when deleting dealers worked out' do
    result = subject.invoke(params: params)
    expect(result).to be_success
  end
end
