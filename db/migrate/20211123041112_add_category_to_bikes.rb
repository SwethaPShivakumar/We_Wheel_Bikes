class AddCategoryToBikes < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :category, :string
  end
end
