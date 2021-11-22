class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :description
      t.integer :price
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
