class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password, limit: 128, null: false
      t.string :email, null: false
      t.integer :power, null: false
      t.references :gender_id, null: false

      t.timestamps
    end
  end
end
