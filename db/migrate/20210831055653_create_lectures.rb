class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :name
      t.string :teacher
      t.integer :grade
      t.string :term

      t.timestamps
    end
  end
end
