class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.integer :from_id, null: false, foreign_key: true
      t.integer :to_id, null: false, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
