class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :body
      t.integer :user_id
      t.string :image
      t.boolean :solved, :default => false, :null => false
      

      t.timestamps
    end
  end
end
