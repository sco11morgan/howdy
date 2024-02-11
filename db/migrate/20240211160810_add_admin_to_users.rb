class AddAdminToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :admin, :boolean
    add_reference :users, :team, index: true
  end
end
