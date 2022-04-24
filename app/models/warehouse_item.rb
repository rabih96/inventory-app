class WarehouseItem < ApplicationRecord
  belongs_to :item
  belongs_to :warehouse

  validates :item, :warehouse, presence: true
  validates :quantity, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    message: 'should be a positive integer'
  }
end
