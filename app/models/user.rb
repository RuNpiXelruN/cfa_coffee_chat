class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :chats
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
