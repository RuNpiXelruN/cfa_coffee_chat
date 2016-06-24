class User < ActiveRecord::Base
  has_one :profile, dependent: :destroy
  has_many :chats
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship"
  has_many :followers, through: :follower_relationships

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"
  has_many :followed_users, through: :followed_user_relationships



  has_many :tutee_relationships,
    foreign_key: :tutor_id,
    class_name: 'TutoringRelationship'
  has_many :tutees, through: :tutee_relationships

  has_many :tutor_relationships,
    foreign_key: :tutee_id,
    class_name: 'TutoringRelationship'
  has_many :tutors, through: :tutor_relationships

  def following? user
    followed_user_ids.include?(user.id)
  end

  def is_connected? user
    tutee_ids.include?(user.id)
  end
end
