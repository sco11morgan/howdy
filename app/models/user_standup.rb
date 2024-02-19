# == Schema Information
#
# Table name: user_standups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  standup_id :integer          not null
#  team_id    :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_user_standups_on_standup_id  (standup_id)
#  index_user_standups_on_team_id     (team_id)
#  index_user_standups_on_user_id     (user_id)
#
# Foreign Keys
#
#  standup_id  (standup_id => standups.id)
#  team_id     (team_id => teams.id)
#  user_id     (user_id => users.id)
#
class UserStandup < ApplicationRecord
  belongs_to :team
  belongs_to :user
  belongs_to :standup
end
