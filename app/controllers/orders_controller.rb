class OrdersController < ApplicationController
	def index
    @orders = Order.all
    respond_to do |format|
      format.html
      format.json { render json: @orders }
      format.xlsx { render xlsx: 'index'}
    end
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end

  def new
    @order = Order.new
    @product = Product.new
  end

  def create
    @order = Order.new(order_params)
    @order.product = Product.find_by_id(params['produto'])
    if @order.save
      respond_to do |format|
        format.html { redirect_to @order }
        format.json { render json: @order, status: :created }
      end
    else
      render 'new'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order = Order.destroy(params[:id])
      respond_to do |format|
        format.html { redirect_to orders_path }
        format.json { render json: @order, status: :created }
      end
  end

  private

  def order_params
    params.require(:order).permit(:data, :quantity, :value)
  end
end
