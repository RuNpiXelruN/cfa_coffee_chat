class Profile < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :comments
  has_many :locations, as: :locationable, dependent: :destroy
end
