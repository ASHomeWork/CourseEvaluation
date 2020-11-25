class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.integer :score, null: false
      t.references :course_id, null: false
      t.references :user_id, null: false

      t.timestamps
    end
  end
end
