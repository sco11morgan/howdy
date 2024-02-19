# == Schema Information
#
# Table name: team_questions
#
#  id         :integer          not null, primary key
#  index      :integer
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer          not null
#
# Indexes
#
#  index_team_questions_on_team_id  (team_id)
#
# Foreign Keys
#
#  team_id  (team_id => teams.id)
#
class TeamQuestion < ApplicationRecord
  belongs_to :team
end
