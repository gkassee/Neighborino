class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :question_id
      t.string :body

      t.timestamps null: false
    end
  end
end
