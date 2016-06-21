class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :body
      t.float :latitude
      t.float :longitude
      t.float :ip_address

      t.timestamps null: false
    end
  end
end
