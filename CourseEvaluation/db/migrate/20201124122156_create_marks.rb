class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.integer :score, null: false
      t.reference :course_id, null: false
      t.reference :user_id, null: false

      t.timestamps
    end
  end
end
