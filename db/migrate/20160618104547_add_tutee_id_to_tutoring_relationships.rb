class AddTuteeIdToTutoringRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :tutoring_relationships, :tutee, foreign_key: true
  end
end
