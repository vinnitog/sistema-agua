class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name
    	t.string :tel
    	t.string :address
    	t.string :cpf
    	t.string :rg
      t.timestamps null: false
    end
  end
end