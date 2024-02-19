class Post < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :team, null: false, foreign_key: true
    add_column :posts, :standup_date, :date
    remove_column :posts, :message
  end
end
