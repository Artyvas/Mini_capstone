class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.integer :price
      t.string :category
      t.integer :quantity
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
