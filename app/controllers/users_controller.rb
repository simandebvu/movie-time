class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = User.find_by_id(params[:id])
    @user_opinions = @user.own_opinions(@user)
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_back fallback_location: root_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_back fallback_location: root_path
  end
end
