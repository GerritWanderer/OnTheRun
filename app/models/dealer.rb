class Dealer < ApplicationRecord
  validates :name, presence: true
  validates :source, inclusion: { in: [Salesforce::SOURCE] }, if: ->(dealer) { dealer.source_id }
  validates :source_id, presence: true, if: ->(dealer) { dealer.source }

  scope :with_geolocation, -> { where.not(lat: nil).or(where.not(lon: nil)) }
end
