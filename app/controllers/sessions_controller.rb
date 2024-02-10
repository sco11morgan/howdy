class SessionsController < ApplicationController
  before_action :user_authenticated, only: [:new]
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    auto_login(@user)
    # if login(params[:email], params[:password])
    if @user && auto_login(@user)
      flash[:success] = "Welcome back!"
      redirect_back_or_to root_path
    else
      flash.now[:warning] = "E-mail and/or password is incorrect."
      render "new"
    end
  end

  def destroy
    logout
    flash[:success] = "You are not logged out."
    redirect_to login_path
  end

  private

  def user_authenticated
    if logged_in?
      return redirect_to posts_path
    end
  end
end