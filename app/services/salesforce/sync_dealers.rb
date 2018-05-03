class Salesforce::SyncDealers
  include Services::Service
  attr_accessor :client, :last_migrated_at
  wrap_in_transaction(Dealer)

  FIELDS = [
    'Id',
    'Name',
    'POS_Street__c',
    'POS_ZIP__c',
    'POS_City__c',
    'POS_Country__c',
    'POS_State__c',
    'POS_Phone__c',
    'Dealer_Latitude__c',
    'Dealer_Longitude__c'
  ]

  def initialize
    @client = Restforce.new
    @last_migrated_at = DateTime.now
  end

  def invoke
    begin
      dealers = client.query("select #{FIELDS.join(', ')}
        from Account where E_Shop_Dealer__c = '#{Salesforce::DEALER_POS_TYPE}'")
    rescue Exception => e
      return Services::Error.new(:salesforce_connection_error)
    end

    begin
      dealers.each do |dealer|
        dealer_params = build_dealer_params(dealer)
        Dealers::CreateOrUpdateFromSource.invoke(params: dealer_params)
      end
    rescue Exception => e
      return Services::ValidationError.new(e.record)
    end
    return Services::Success.new
  end

  def build_dealer_params(dealer)
    return {
      name: dealer.Name,
      street: dealer.POS_Street__c,
      zip_code: dealer.POS_ZIP__c,
      city: dealer.POS_City__c,
      country: dealer.POS_Country__c,
      state: dealer.POS_State__c,
      phone: dealer.POS_Phone__c,
      lat: dealer.Dealer_Latitude__c,
      lon: dealer.Dealer_Longitude__c,
      source_id: dealer.Id,
      source: Salesforce::SOURCE,
      last_migrated_at: last_migrated_at
    }
  end
end
