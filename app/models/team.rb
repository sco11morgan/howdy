# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :user_teams
  has_many :users, through: :user_teams

  def user_teams_ordered_by_name
    user_teams.includes(:user).order("users.name")
  end

end
