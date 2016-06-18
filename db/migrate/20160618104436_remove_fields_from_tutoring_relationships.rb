class RemoveFieldsFromTutoringRelationships < ActiveRecord::Migration[5.0]
  def change
    remove_column :tutoring_relationships, :student_id
  end
end
