class AddTwitterDataToUser < ActiveRecord::Migration

  def change
  	add_column :users, :profile_pic, :string
  	add_column :users, :bio, :string
  end

end
