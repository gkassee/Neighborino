class UserController < ApplicationController

  def index
  	@user = current_user
  end

  def show
    @user = User.find(params[:id])
    @question = Question.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  def delete
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address1, :address2, :city, :state, :zip, :latitude, :longitude, :profile_pic, :bio)
  end

end
