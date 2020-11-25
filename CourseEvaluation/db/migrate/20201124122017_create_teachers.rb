class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.references :college, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true
      t.string :email, null: false

      t.timestamps
    end
  end
end
