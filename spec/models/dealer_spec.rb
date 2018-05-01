require 'rails_helper'

RSpec.describe Dealer, type: :model do
  let(:dealer) { Dealer.new(name: 'Sportcheck') }

  it 'is valid' do
    expect(dealer).to be_valid
  end
  
  context 'validations' do
    it 'forbids a blank name' do
      dealer.name = ''
      expect(dealer).to be_invalid
    end

    it 'allows a source_id and valid source' do
      dealer.source_id = '1234567890'
      dealer.source = Salesforce::SOURCE
      expect(dealer).to be_valid
    end

    it 'forbids empty source when source_id is present' do
      dealer.source_id = '1234567890'
      expect(dealer).to be_invalid
    end

    it 'forbids empty source_id when source is present' do
      dealer.source = Salesforce::SOURCE
      expect(dealer).to be_invalid
    end

    it 'forbids sources that are not present' do
      dealer.source_id = '1234567890'
      dealer.source = 'unknown'
      expect(dealer).to be_invalid
    end
  end
end
