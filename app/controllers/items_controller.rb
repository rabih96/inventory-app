class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
  end

  def show
    @warehouse_items = WarehouseItem.where(item: @item)
  end

  def edit; end

  def new
    @item = Item.new
  end

  def destroy
    @item.destroy
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end
