class WarehouseItemsController < ApplicationController
  before_action :set_warehouse_item, only: %i[destroy update]

  def create
    warehouse = Warehouse.find(warehouse_item_params[:warehouse])
    item = Item.find(warehouse_item_params[:item])
    quantity = warehouse_item_params[:quantity]
    @warehouse_item = WarehouseItem.new(item: item, warehouse: warehouse, quantity: quantity)
    if @warehouse_item.save!
      @warehouse_item.save
      redirect_to warehouse_path(warehouse)
    else
      render :new
    end
  end

  def destroy
    @warehouse_item.destroy
    redirect_to warehouses_path
  end

  def edit
    @warehouse = Warehouse.find(params[:warehouse_id])
    @warehouse_item = WarehouseItem.find(params[:id])
  end

  def update
    warehouse = Warehouse.find(warehouse_item_params[:warehouse])
    item = Item.find(warehouse_item_params[:item])
    quantity = warehouse_item_params[:quantity]
    if @warehouse_item.update(item: item, warehouse: warehouse, quantity: quantity)
      redirect_to warehouse_path(warehouse)
    else
      render :edit
    end
  end

  private

  def set_warehouse_item
    @warehouse = Warehouse.find(params[:warehouse_id])
    @warehouse_item = WarehouseItem.find(params[:id])
  end

  def warehouse_item_params
    params.require(:warehouse_item).permit(:item, :warehouse, :quantity)
  end
end
