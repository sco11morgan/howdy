class CreateStandups < ActiveRecord::Migration[7.1]
  def change
    create_table :standups do |t|
      t.date :date
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
