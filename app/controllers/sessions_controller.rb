class SessionsController < ApplicationController
  def new
  end

  def create
  	#Pull the user out of the database
  	user = User.find_by(email: params[:session][:email].downcase)
  	#log the user in if he exists
    if user && user.authenticate(params[:session][:password])
    	log_in user
    	# Redirect to the user's profile page. Same as user_url(user)
    	redirect_to user
    else
    	flash[:danger] = 'Invalid email/password combination'
  		render 'new'
    end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end
end
