class Salesforce::SyncDealers
  include Services::Service
  attr_accessor :client, :last_migrated_at
  wrap_in_transaction(Dealer)

  def initialize
    @client = Restforce.new
    @last_migrated_at = DateTime.now
  end

  def invoke
    begin
      dealers = client.query("select #{Salesforce::FIELDS.join(', ')}
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
      city: dealer.POS_CITY__c,
      country: dealer.POS_COUNTRY__c,
      state: dealer.POS_STATE__c,
      phone: dealer.POS_PHONE__c,
      lat: dealer.Dealer_Latitude__c,
      lon: dealer.Dealer_Longitude__c,
      source_id: dealer.Id,
      source: Salesforce::SOURCE,
      last_migrated_at: last_migrated_at
    }
  end
end
