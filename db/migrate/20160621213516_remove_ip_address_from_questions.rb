class RemoveIpAddressFromQuestions < ActiveRecord::Migration
  def change
  	remove_column :questions, :ip_address
  	add_column :questions, :address, :string
  end
end
