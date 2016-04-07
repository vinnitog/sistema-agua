class ProductsController < ApplicationController
before_filter :authorize
  
  def index  
  @products = Product.all
  respond_to do |format|
    format.html
    format.json { render json: @products }
  end
    
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
    @brand = Brand.new
  end

  def edit
    @product = Product.find(params[:id])
    @brands = Brand.all
  end

  def create
    @product = Product.new(product_params)
    @product.brand = Brand.find_by_id(params['marca'])

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
  	@product = Product.find(params[:id])
    @product.brand = Brand.find_by_id(params['brands'])
    if @product.update(product_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product = Product.destroy(params[:id])
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :quantity, :price)
  end
end
