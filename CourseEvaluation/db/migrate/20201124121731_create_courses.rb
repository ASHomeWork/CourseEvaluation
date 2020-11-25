class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.references :major, null: false, foreign_key: true
      t.date :year, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
