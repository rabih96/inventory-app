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

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end
end
