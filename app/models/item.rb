class Item < ApplicationRecord
  has_many :warehouse_items, dependent: :destroy
  has_many :warehouses, through: :warehouse_items

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
