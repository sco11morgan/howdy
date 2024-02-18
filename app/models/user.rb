class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :user_teams
  has_many :teams, through: :user_teams

  def make_admin!
    update(admin: true)
  end

  def team
    user_teams.first.team if user_teams.size == 1
  end
end
