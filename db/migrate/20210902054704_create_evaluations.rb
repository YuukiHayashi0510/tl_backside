class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :overall
      t.integer :understandability
      t.integer :usefulness
      t.integer :easy
      t.integer :assignment
      t.integer :user_id
      t.integer :lecture_id

      t.timestamps
    end
  end
end