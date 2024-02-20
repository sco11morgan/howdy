class UserStandupsController < ApplicationController
  before_action :set_user_standup, only: %i[ show edit update destroy ]

  # GET /user_standups or /user_standups.json
  def index
    # @user_standups = UserStandup.all.includes(:standup).order("standups.date desc")
    @user_standups = UserStandup.all.reverse
  end

  # GET /user_standups/1 or /user_standups/1.json
  def show
  end

  # GET /user_standups/new
  def new
    standup = Standup.find_or_create_by(team: current_team, date: Date.today)
    @user_standup = UserStandup.new(user: current_user, team: current_team, standup: standup)
  end

  # GET /user_standups/1/edit
  def edit
  end

  # POST /user_standups or /user_standups.json
  def create
    @user_standup = UserStandup.new(user_standup_params)

    respond_to do |format|
      if @user_standup.save
        format.html { redirect_to user_standup_url(@user_standup), notice: "User standup was successfully created." }
        format.json { render :show, status: :created, location: @user_standup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_standup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_standups/1 or /user_standups/1.json
  def update
    respond_to do |format|
      if @user_standup.update(user_standup_params)
        format.html { redirect_to user_standup_url(@user_standup), notice: "User standup was successfully updated." }
        format.json { render :show, status: :ok, location: @user_standup }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_standup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_standups/1 or /user_standups/1.json
  def destroy
    @user_standup.destroy!

    respond_to do |format|
      format.html { redirect_to user_standups_url, notice: "User standup was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_standup
      @user_standup = UserStandup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_standup_params
      params.require(:user_standup).permit(:team_id, :user_id, :standup_id, posts_attributes: [:id, :content])
    end
end
