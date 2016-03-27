class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :quantity, presence: true
	validates :price, presence: true
	validates :brand, presence: true
end