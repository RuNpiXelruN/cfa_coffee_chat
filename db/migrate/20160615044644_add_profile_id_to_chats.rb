class AddProfileIdToChats < ActiveRecord::Migration[5.0]
  def change
    add_reference :chats, :profile, foreign_key: true
  end
end
