class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[show edit update destroy]

  def index
    @warehouses = Warehouse.all
  end

  def show; end

  def edit; end

  def new
    @warehouse = Warehouse.new
  end

  def destroy
    @warehouse.destroy
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to warehouses_path
    else
      render :edit
    end
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save!
      @warehouse.save
      redirect_to warehouses_path
    else
      render :new
    end
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name, :location)
  end
end
