class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(micropost_params[:image])
    if @micropost.save
      flash[:success] = 'micropost created!'
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost = current_user.microposts.find(params[:id])
    redirect_to root_url, status: :see_other if @micropost.nil?

    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image, :platform_id)
  end
end
