class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :chats
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: 'FollowingRelationship'
  has_many :followers, through: :follower_relationships

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships

  def following? user
    followed_user_ids.include?(user.id)
  end
end
