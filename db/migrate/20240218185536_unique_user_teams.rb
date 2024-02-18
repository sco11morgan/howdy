class UniqueUserTeams < ActiveRecord::Migration[7.1]
  def change
    add_index :user_teams, [:user_id, :team_id], unique: true
  end
end
