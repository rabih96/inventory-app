require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test 'should create item' do
    assert_difference('Item.count') do
      post items_url, params: { item: { name: 'Potato' } }
    end

    assert_redirected_to items_path
  end

  test 'should show item' do
    get item_url(@item)
    assert_response :success
  end

  test 'should destroy item' do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_path
  end

  test 'should destroy warehouse items when item is destoyed' do
    assert_difference('WarehouseItem.count', -@item.warehouse_items.count) do
      delete item_url(@item)
    end

    assert_redirected_to items_path
  end

  test 'should update item' do
    patch item_url(@item), params: { item: { name: 'New Item Name' } }

    assert_redirected_to items_path
    @item.reload
    assert_equal 'New Item Name', @item.name
  end
end
