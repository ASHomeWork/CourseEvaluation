class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :password_digest, null: false
      t.string :email, null: false
      t.integer :power, null: false
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
