class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
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
    authenticate_user!

    @platform = Platform.find(params[:platform_id])
    current_user.subscribe @platform

    redirect_to platform_path(@platform)
  end

  # DELETE /users/subscriptions
  def unsubscribe
    authenticate_user!

    @platform = Platform.find(params[:platform_id])
    current_user.unsubscribe @platform

    redirect_to platform_path(@platform)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
