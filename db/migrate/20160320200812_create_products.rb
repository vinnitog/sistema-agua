class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.decimal :price
    	t.string :category
    	t.integer :stock
    	t.string :brand
      t.timestamps null: false
    end
  end
end