require "test_helper"

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse = warehouses(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should create warehouse' do
    assert_difference('Warehouse.count') do
      post warehouses_url, params: { warehouse: { name: 'Warehouse 3', location: 'Ottawa' } }
    end

    assert_redirected_to warehouses_path
  end

  test 'should show warehouse' do
    get warehouse_url(@warehouse)
    assert_response :success
  end

  test 'should destroy warehouse' do
    assert_difference('Warehouse.count', -1) do
      delete warehouse_url(@warehouse)
    end

    assert_redirected_to warehouses_path
  end

  test 'should destroy warehouse items when warehouse is destoyed' do
    assert_difference('WarehouseItem.count', -@warehouse.warehouse_items.count) do
      delete warehouse_url(@warehouse)
    end

    assert_redirected_to warehouses_path
  end

  test 'should update warehouse' do
    patch warehouse_url(@warehouse), params: { warehouse: { name: 'New Warehouse', location: 'New Location' } }

    assert_redirected_to warehouses_path
    @warehouse.reload
    assert_equal 'New Warehouse', @warehouse.name
    assert_equal 'New Location', @warehouse.location
  end
end
