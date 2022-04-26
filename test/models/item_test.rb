require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test 'valid if it has a name' do
    item = Item.new(name: 'test')
    item.valid?
    assert_empty item.errors[:name]
  end

  test 'invalid if it does not have a name' do
    item = Item.new
    item.invalid?
    assert_not item.errors[:name].empty?
  end

  test 'invalid if the name already exists' do
    Item.create!(name: 'test')
    item2 = Item.new(name: 'test')
    item2.invalid?
    assert_not item2.errors[:name].empty?
  end
end
