class Salesforce::DeleteDealers
  include Services::Service
  attr_accessor :client

  def initialize
    @client = Restforce.new
  end

  def invoke
    begin
      dealers = client.query_all("select Id from Account
        where E_Shop_Dealer__c = '#{Salesforce::DEALER_POS_TYPE}' and isDeleted = true")
    rescue Exception => e
      return Services::Error.new(:salesforce_connection_error)
    end

    Dealer.where(source_id: dealers.map(&:Id), source: Salesforce::SOURCE).destroy_all
    return Services::Success.new
  end
end
