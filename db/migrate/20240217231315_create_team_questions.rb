class CreateTeamQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :team_questions do |t|
      t.text :message
      t.integer :index
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
