require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

	let!(:valid_attributes){
		{name: 'Lorem', address: 'Rua Lorem Ipsum, nº 10', tel: '(DDD)-3433-3333',
		cpf: '444.444.444.44', rg: '44.444.444-x'}
	}

	describe 'CREATE' do
    it 'test create client' do
		  @clients = Client.create(valid_attributes)
		  expect(:clients).to eq(@clients)
    end
	end

end
