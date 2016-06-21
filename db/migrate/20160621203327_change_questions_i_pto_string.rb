class ChangeQuestionsIPtoString < ActiveRecord::Migration
  def change
  	change_column :questions, :ip_address, :string
  end
end
