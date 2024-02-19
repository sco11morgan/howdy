class HomeController < ApplicationController
  def index
    @team = current_user.team
    @standups = Standup.where(team: current_user.teams)
    @my_posts = Post.where(user: current_user)
  end
end
