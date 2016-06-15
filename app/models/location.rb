class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true
  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    [address, suburb, state, country, postcode].compact.join(', ')
  end
end
