class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :order
  
	validates :name, presence: true
	validates :quantity, presence: true
	validates :price, presence: true
end