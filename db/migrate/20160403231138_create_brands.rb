class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :brand_type
      
      t.timestamps null: false
    end
  end
end
