class UserTeamsController < ApplicationController
  before_action :set_user_team, only: %i[ show edit update destroy ]

  # GET /user_teams or /user_teams.json
  def index
    @user_teams = UserTeam.all
  end

  # GET /user_teams/1 or /user_teams/1.json
  def show
  end

  # GET /user_teams/new
  def new
    new_params = params.permit(:team_id, :only_user, :only_team)
    @team_id = new_params[:team_id]
    @only_team = new_params[:only_team]
    @only_user = new_params[:only_user]
    @user_team = UserTeam.new(team_id: @team_id)
    @users = User.all.order(:name)
    if @team_id
      @team = Team.find(@team_id)
      @users = @users - @team.users
    end
    @teams = Team.all.order(:name)
  end

  # GET /user_teams/1/edit
  def edit
    @users = User.all.order(:name)
    @teams = Team.all.order(:name)
  end

  # POST /user_teams or /user_teams.json
  def create
        # binding.break
    @user_team = UserTeam.new(user_team_params)



    respond_to do |format|
      if @user_team.save
        format.html { redirect_to user_team_url(@user_team), notice: "User team was successfully created." }
        format.json { render :show, status: :created, location: @user_team }
        format.turbo_stream { flash.now[:notice] = "Successfully added." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_teams/1 or /user_teams/1.json
  def update
    respond_to do |format|
      if @user_team.update(user_team_params)
        format.html { redirect_to user_team_url(@user_team), notice: "User team was successfully updated." }
        format.json { render :show, status: :ok, location: @user_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_teams/1 or /user_teams/1.json
  def destroy
    @user_team.destroy!

    respond_to do |format|
      format.html { redirect_to user_teams_url, notice: "User team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_team
      @user_team = UserTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_team_params
      params.require(:user_team).permit(:user_id, :team_id)
    end
end
