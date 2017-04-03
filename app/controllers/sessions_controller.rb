class SessionsController < ApplicationController
  def new
  end

  def create
  	#Pull the user out of the database
  	user = User.find_by(email: params[:session][:email].downcase)
  	#log the user in if he exists
    if user && user.authenticate(params[:session][:password])
    	if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
