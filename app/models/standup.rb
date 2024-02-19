# == Schema Information
#
# Table name: standups
#
#  id         :integer          not null, primary key
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer          not null
#
# Indexes
#
#  index_standups_on_team_id  (team_id)
#
# Foreign Keys
#
#  team_id  (team_id => teams.id)
#
class Standup < ApplicationRecord
  belongs_to :team
end
