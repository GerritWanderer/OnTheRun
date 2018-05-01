class Dealers::CreateOrUpdateFromSource
  include Services::Service
  attr_accessor :params

  def invoke
    dealer = Dealer.find_or_initialize_by(source_id: params[:source_id], source: params[:source])
    dealer.assign_attributes(params)
    dealer.save!
    return Services::Success.new(dealer)
  end
end
