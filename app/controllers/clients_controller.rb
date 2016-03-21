class ClientsController < ApplicationController
  include HTTParty

  def index
    @clients = Client.all
    #@response = HTTParty.get('http://localhost:3000/clients', body: {}.to_json)
    
  end

  def show
    @client = Client.find(params[:id])
    #@response = HTTParty.get('http://localhost:3000/clients/#id', body: {}.to_json)
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def update
  	@client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client = Client.destroy(params[:id])
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :address, :tel, :cpf, :rg)
  end
  end
