class ClientsController < ApplicationController
#before_filter :authorize

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
      respond_to do |format|
        format.html { redirect_to @client }
        format.json { render json: @client, status: :created }
      end
    else
      render 'new'
    end
  end

  def update
  	@client = Client.find(params[:id])
    if @client.update(client_params)
      respond_to do |format|
        format.html { redirect_to @client }
        format.json { render json: @client, status: :created }
      end
    else
      render 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client = Client.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to clients_path }
      format.json { render json: @client, status: :created }
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :address, :tel, :cpf, :rg)
  end
end
