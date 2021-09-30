class AddDetailsToLectures < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :grade, :integer
    add_column :lectures, :term, :string
  end
end
