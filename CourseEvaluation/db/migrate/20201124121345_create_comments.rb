class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :user_id, null: false
      t.references :course_id, null: false

      t.timestamps
    end
  end
end
