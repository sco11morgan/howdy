class AddUserStandupPost < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user_standup
  end
end
