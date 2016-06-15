class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :chat
end
