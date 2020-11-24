class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.reference :from, null: false
      t.reference :to, null: false

      t.timestamps
    end
  end
end
