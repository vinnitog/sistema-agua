class Product < ActiveRecord::Base
	validates :price, presence: true
	validates :category, presence: true
	validates :stock, presence: true
	validates :brand, presence: true
end