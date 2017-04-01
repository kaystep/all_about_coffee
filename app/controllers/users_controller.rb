class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  #Create the user object since the signup page is routed to users new
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to All About Coffee!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  

  private
  	#only allow this paramaters in and nothing else, also make sure that the user submits them in the signup form
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
