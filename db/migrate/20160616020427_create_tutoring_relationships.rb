class CreateTutoringRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :tutoring_relationships do |t|
      t.references :tutor, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
