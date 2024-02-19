# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  standup_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_posts_on_team_id  (team_id)
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  team_id  (team_id => teams.id)
#  user_id  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :team
  belongs_to :user
  has_markdown :content
  validates :content, presence: true

end
