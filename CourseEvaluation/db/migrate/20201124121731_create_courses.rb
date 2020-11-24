class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.reference :major_id, null: false
      t.date :year, null: false

      t.timestamps
    end
  end
end
