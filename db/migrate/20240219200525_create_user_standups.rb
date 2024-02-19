class CreateUserStandups < ActiveRecord::Migration[7.1]
  def change
    create_table :user_standups do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :standup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
