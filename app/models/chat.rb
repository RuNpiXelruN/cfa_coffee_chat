class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  has_many :comments
end
