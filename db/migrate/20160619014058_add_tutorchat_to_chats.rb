class AddTutorchatToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :tutorchat, :boolean, default: false
  end
end
