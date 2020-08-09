class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  before_action :authenticate_user!

  # GET /opinions
  def index
    @opinion = Opinion.new
    @opinions = current_user.all_opinions(current_user)
    @suggestions = current_user.all_suggestions(current_user)
  end

  def show_users_posts
    @opinions = Opinion.where(user_id: current_user.id)
    @user = User.includes(followers: :follower, followings: :followed).find(current_user.id)
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show; end

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = current_user.opinions.build(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to root_path, notice: 'Opinion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opinion
    @opinion = Opinion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
