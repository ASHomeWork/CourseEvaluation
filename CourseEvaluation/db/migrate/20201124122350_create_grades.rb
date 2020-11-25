class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :year, null: false
      
      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
