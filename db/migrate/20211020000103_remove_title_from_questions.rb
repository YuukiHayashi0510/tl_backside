class RemoveTitleFromQuestions < ActiveRecord::Migration[6.1]
  def up
    remove_column :questions, :title, :string
  end

  def down
    add_column :questions, :title, :string
  end
end
