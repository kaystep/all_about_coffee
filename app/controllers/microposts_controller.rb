class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy
  
	def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Review Posted!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

	def destroy
    @micropost.destroy
    flash[:success] = "Your review has been deleted"
    redirect_to request.referrer || root_url
  end

  def index
  @microposts = Micropost.all
  if params[:search]
    @microposts = Micropost.search(params[:search]).order("created_at DESC")
  else
    @microposts = Micropost.all.order("created_at DESC")
  end
end


	private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :search)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
