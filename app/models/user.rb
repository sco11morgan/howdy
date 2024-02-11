class User < ApplicationRecord
  authenticates_with_sorcery!

  belongs_to :team

  def make_admin!
    update(admin: true)
  end
end
