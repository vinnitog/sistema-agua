class Brand < ActiveRecord::Base
  has_many :products
  has_many :orders
  
  validates :name , presence: true
end
