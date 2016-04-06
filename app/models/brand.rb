class Brand < ActiveRecord::Base
  has_many :products
  
  validates :name , presence: true
  validates :brand_type, presence: true
end
