class Location < ApplicationRecord
  belongs_to :locationable, polymorphic: true
end
