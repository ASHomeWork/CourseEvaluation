class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.reference :course_id, null: false
      t.reference :user_id, null: false
      t.date :year, null: false
      
      t.timestamps
    end
  end
end
