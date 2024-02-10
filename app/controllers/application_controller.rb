class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    flash[:warning] = "You have to authenticate to access this page."
    redirect_to login_path
  end
end
