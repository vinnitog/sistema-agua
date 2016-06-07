class Order < ActiveRecord::Base
	belongs_to :product

	validates :date, presence: true
	validates :quantity, presence: true
	validates :value, presence: true
end
