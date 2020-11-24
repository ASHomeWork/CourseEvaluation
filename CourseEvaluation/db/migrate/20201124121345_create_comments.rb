class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.reference :user_id, null: false
      t.reference :course_id, null: false

      t.timestamps
    end
  end
end
