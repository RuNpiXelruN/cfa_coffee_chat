class Chat < ApplicationRecord
  acts_as_votable
  belongs_to :user
  belongs_to :profile
  has_many :comments
end
