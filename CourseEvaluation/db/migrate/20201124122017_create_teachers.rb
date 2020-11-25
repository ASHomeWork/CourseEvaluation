class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.references :college_id, null: false
      t.references :gender_id, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
