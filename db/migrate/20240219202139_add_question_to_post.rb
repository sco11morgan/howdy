class AddQuestionToPost < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :question, :text
  end
end
