class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :address, presence: true
	validates :tel, presence: true
	validate :cpf
	validate :rg
end