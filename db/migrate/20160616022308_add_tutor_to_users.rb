class AddTutorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tutor, :boolean, default: false
  end
end
