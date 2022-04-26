require "test_helper"

class WarehouseItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_item = warehouse_items(:one)
    @warehouse = warehouses(:one)
    @item = items(:two)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should create warehouse item' do
    assert_difference('WarehouseItem.count') do
      post warehouse_warehouse_items_url(@warehouse.id), params: {
        warehouse_item: { quantity: 1, item: @item.id, warehouse: @warehouse.id }
      }
    end

    assert_redirected_to warehouse_path(@warehouse_item.warehouse)
  end

  test 'should destroy warehouse item' do
    assert_difference('WarehouseItem.count', -1) do
      delete "/warehouses/#{@warehouse.id}/warehouse_items/#{@warehouse_item.id}"
    end

    assert_redirected_to warehouses_path
  end

  test 'should update warehouse item' do
    patch "/warehouses/#{@warehouse.id}/warehouse_items/#{@warehouse_item.id}", params: {
      warehouse_item: { quantity: 123, item: @item.id, warehouse: @warehouse.id }
    }

    assert_redirected_to warehouse_path(@warehouse)
    @warehouse_item.reload
    assert_equal 123, @warehouse_item.quantity
  end
end
