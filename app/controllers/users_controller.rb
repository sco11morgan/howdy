class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :require_login, only: [:new, :create]

  # GET /users or /users.json
  def index
    @users = User.all.order(:name)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @teams = Team.all.order(:name)
  end

  # GET /users/1/edit
  def edit
    @teams = Team.all.order(:name)
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      auto_login(@user)
      flash[:success] = "Welcome to Howdy"
      # redirect_to user_url(@user), notice: "User was successfully created."
      redirect_to root_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :team_id)
    end
end
