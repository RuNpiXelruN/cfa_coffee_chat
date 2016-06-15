class Profile < ApplicationRecord
  belongs_to :user
  has_many :chats
  has_many :comments
end
