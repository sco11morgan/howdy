# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  admin                        :boolean
#  crypted_password             :string
#  email                        :string           not null
#  name                         :string
#  remember_me_token            :string
#  remember_me_token_expires_at :datetime
#  salt                         :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_users_on_email              (email) UNIQUE
#  index_users_on_remember_me_token  (remember_me_token)
#
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
