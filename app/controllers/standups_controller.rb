class StandupsController < ApplicationController
  before_action :set_standup, only: %i[ show edit ]

  # GET /standups or /standups.json
  def index
    @standups = Standup.all
  end

  # GET /standups/1 or /standups/1.json
  def show
  end

  # GET /standups/new
  def new
    @standup = Standup.new(date: Date.today)
    @teams = current_user.teams.order(:name)
  end

  # GET /standups/1/edit
  def edit
  end

  # POST /standups or /standups.json
  def create
    standup_params[:date] = Date.today if standup_params[:date] == "today"
    @standup = Standup.new(standup_params)
    @teams = current_user.teams.order(:name)

    respond_to do |format|
      if @standup.save
        format.html { redirect_to standup_url(@standup), notice: "Standup was successfully created." }
        format.json { render :show, status: :created, location: @standup }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @standup.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standup
      @standup = Standup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def standup_params
      params.require(:standup).permit(:date, :team_id)
    end
end
