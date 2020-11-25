class CreateMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :majors do |t|
      t.string :name, null: false
      t.references :college_id, null: false

      t.timestamps
    end
  end
end
