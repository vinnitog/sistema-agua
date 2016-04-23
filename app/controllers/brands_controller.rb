class BrandsController < ApplicationController
#before_filter :authorize

  def index
    @brands = Brand.all
    respond_to do |format|
      format.html
      format.json { render json: @brands }
    end
  end

  def show
    @brand = Brand.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @brand }
    end
  end

  def new
    @brand = Brand.new
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      respond_to do |format|
        format.html { redirect_to @brand }
        format.json { render json: @brand, status: :created }
      end
    else
      render 'new'
    end
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      respond_to do |format|
        format.html { redirect_to @brand }
        format.json { render json: @brand, status: :created }
      end
    else
      render 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand = Brand.destroy(params[:id])
      respond_to do |format|
        format.html { redirect_to brands_path }
        format.json { render json: @brand, status: :created }
      end
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :brand_type)
  end
end
