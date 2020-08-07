class OpinionsController < ApplicationController
  before_action :set_opinion, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  before_action :authenticate_user!

  # GET /opinions
  # GET /opinions.json
  def index
    @opinion = Opinion.new
    ids = current_user.followings.pluck(:followed_id) << current_user.id
    @opinions = Opinion.where(user_id: ids).order({ created_at: :desc })
    @suggestions = User.where('id NOT IN (?)', current_user.followings.map(&:followed_id) + [current_user.id])
      .limit(5)
      .order(created_at: :desc)
  end

  def show_users_posts
    @opinions = Opinion.where(user_id: current_user.id)
  end

  # GET /opinions/1
  # GET /opinions/1.json
  def show; end

  # GET /opinions/new
  def new; end

  # GET /opinions/1/edit
  def edit; end

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

  # PATCH/PUT /opinions/1
  # PATCH/PUT /opinions/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
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
