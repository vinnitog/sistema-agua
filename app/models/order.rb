class Order < ActiveRecord::Base
	belongs_to :product

	validate :date
	validate :quantity
	validate :value
end
