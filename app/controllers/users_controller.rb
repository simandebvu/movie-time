class UsersController < ApplicationController
  def index
    @users = User.all_except(current_user)
  end

  def show
    @user = set_user
    @user_opinions = @user.own_opinions(@user)
  end

  def follow
    @user = set_user
    current_user.follow(@user)
    redirect_back fallback_location: root_path
  end

  def unfollow
    @user = set_user
    current_user.unfollow(@user)
    redirect_back fallback_location: root_path
  end

  private

  def set_user
    User.find(params[:id])
  end
end
