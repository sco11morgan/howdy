class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams

  def user_teams_ordered_by_name
    user_teams.includes(:user).order("users.name")
  end

end
