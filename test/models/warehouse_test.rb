require "test_helper"

class WarehouseTest < ActiveSupport::TestCase
  test 'valid if it has a name and a location' do
    warehouse = Warehouse.new(name: 'test', location: 'test')
    warehouse.valid?
    assert_empty warehouse.errors
  end

  test 'invalid if it does not have a name' do
    warehouse = Warehouse.new(location: 'test')
    warehouse.invalid?
    assert_not warehouse.errors[:name].empty?
  end

  test 'invalid if it does not have a location' do
    warehouse = Warehouse.new(name: 'test')
    warehouse.invalid?
    assert_not warehouse.errors[:location].empty?
  end

  test 'invalid if the name already exists' do
    Warehouse.create!(name: 'test', location: 'test')
    warehouse2 = Warehouse.new(name: 'test', location: 'test')
    warehouse2.invalid?
    assert_not warehouse2.errors[:name].empty?
  end
end
