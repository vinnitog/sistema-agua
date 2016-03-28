class ClientsController < ApplicationController
before_filter :authorize

  def index
    @clients = Client.all

    respond_to do |format|
      format.html
      format.json { render json: @clients }
    end
    
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @client }
    end
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
