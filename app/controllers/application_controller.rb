class ApplicationController < ActionController::Base
  before_action :require_login
  helper_method :current_admin

  def current_admin
    current_user&.admin
  end

  def current_team
    current_user&.team
  end

  private

  def not_authenticated
    flash[:warning] = "You have to authenticate to access this page."
    redirect_to login_path
  end
end
