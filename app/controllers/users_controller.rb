class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[subscribe unsubscribe]
  before_action :set_platform, only: %i[subscribe unsubscribe]

  # GET /users
  def index
    @search = params[:search]
    @users = User.where('username LIKE ?', "%#{@search}%")
                 .or(User.where('email LIKE ?', "%#{@search}%"))
  end

  # GET /users/1
  def show
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  # POST /users/subscriptions
  def subscribe
    current_user.subscribe @platform

    redirect_to platform_path(@platform)
  end

  # DELETE /users/subscriptions
  def unsubscribe
    current_user.unsubscribe @platform

    redirect_to platform_path(@platform)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_platform
    @platform = Platform.find(params[:platform_id])
  end
end
