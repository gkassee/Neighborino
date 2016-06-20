class HomeController < ApplicationController

  def index
  	@user = current_user
  	if current_user && current_user.address1 == nil

  		redirect_to edit_user_path(@user)
  	end

  end


  def profile
  end

end