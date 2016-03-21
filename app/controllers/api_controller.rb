class ApiController < ApplicationController
include HTTParty
format :json

  def index
    #@response = HTTParty.get('http://localhost:3000/clients/show/#id.json')
  end
end
