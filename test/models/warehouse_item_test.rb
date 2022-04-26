require "test_helper"

class WarehouseItemTest < ActiveSupport::TestCase
  setup do
    @warehouse = Warehouse.new(name: 'test', location: 'test')
    @item = Item.new(name: 'test')
  end

  test 'valid if it has a warehouse, item and a quantity' do
    warehouse_item = WarehouseItem.new(quantity: 10, item: @item, warehouse: @warehouse)
    warehouse_item.valid?
    assert_empty warehouse_item.errors
  end

  test 'invalid if it exists with same item and warehouse ids' do
    WarehouseItem.create!(quantity: 10, item: @item, warehouse: @warehouse)
    warehouse_item = WarehouseItem.new(quantity: 1, item: @item, warehouse: @warehouse)
    warehouse_item.invalid?
    assert_not warehouse_item.errors[:item].empty?
  end

  test 'invalid if it does not have an item' do
    warehouse_item = WarehouseItem.new(quantity: 10, warehouse: @warehouse)
    warehouse_item.invalid?
    assert_not warehouse_item.errors[:item].empty?
  end

  test 'invalid if it does not have a warehouse' do
    warehouse_item = WarehouseItem.new(quantity: 10, item: @item)
    warehouse_item.invalid?
    assert_not warehouse_item.errors[:warehouse].empty?
  end

  test 'invalid if it does not have a quantity' do
    warehouse_item = WarehouseItem.new(item: @item, warehouse: @warehouse)
    warehouse_item.invalid?
    assert_not warehouse_item.errors[:quantity].empty?
  end

  test 'invalid if quantity is negative' do
    warehouse_item = WarehouseItem.new(quantity: -1, item: @item, warehouse: @warehouse)
    warehouse_item.invalid?
    assert_not warehouse_item.errors[:quantity].empty?
  end

  test 'invalid if quantity is not an integer' do
    warehouse_item = WarehouseItem.new(quantity: 5.5, item: @item, warehouse: @warehouse)
    warehouse_item.invalid?
    assert_not warehouse_item.errors[:quantity].empty?
  end
end
