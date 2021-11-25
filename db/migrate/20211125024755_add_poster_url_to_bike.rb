class AddPosterUrlToBike < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :poster_url, :string
  end
end
