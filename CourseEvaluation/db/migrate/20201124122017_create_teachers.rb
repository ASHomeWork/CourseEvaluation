class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.reference :college_id, null: false
      t.reference :gender_id, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
