require "test_helper"

class WarehouseItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get warehouse_items_create_url
    assert_response :success
  end
end
