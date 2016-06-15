class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :profile, foreign_key: true
      t.references :chat, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
