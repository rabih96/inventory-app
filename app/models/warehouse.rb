class Warehouse < ApplicationRecord
  has_many :warehouse_items, dependent: :destroy
  has_many :items, through: :warehouse_items

  validates :name, :location, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
