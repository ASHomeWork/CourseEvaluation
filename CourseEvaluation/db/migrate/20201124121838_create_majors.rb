class CreateMajors < ActiveRecord::Migration[6.0]
  def change
    create_table :majors do |t|
      t.string :name, null: false
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :majors
  end
end
