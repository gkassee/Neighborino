class SessionsController < ApplicationController

	def create
  		auth = request.env["omniauth.auth"] #This is the response you get from the signin call to Twitter
  		session[:omniauth] = auth.except('extra') #This gives you only the part you need and prevents all of the 'extra' stuff from coming along
  		user = User.sign_in_from_omniauth(auth) #passes the twitter user data to my user model
  		session[:user_id] = user.id # This sets the session and logs in the user

      if current_user.address1 == nil
        redirect_to edit_user_path(current_user.id)
      else
  		  redirect_to root_path, notice: "Hi diddly ho, #{current_user.name}!" #Takes you to the home page again, now with an active session
      end
  end


  def destroy
  		session[:user_id] = nil
  		session[:omniauth] = nil
  		redirect_to root_url, notice: "Bye-diddly-i!"
  end

	
end
