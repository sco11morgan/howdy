# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_teams_on_team_id              (team_id)
#  index_user_teams_on_user_id              (user_id)
#  index_user_teams_on_user_id_and_team_id  (user_id,team_id) UNIQUE
#
# Foreign Keys
#
#  team_id  (team_id => teams.id)
#  user_id  (user_id => users.id)
#
class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
