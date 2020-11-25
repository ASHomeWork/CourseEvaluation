class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.references :course_id, null: false
      t.references :user_id, null: false
      t.date :year, null: false
      
      t.timestamps
    end
  end
end
