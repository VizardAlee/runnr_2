class Product < ApplicationRecord
  belongs_to :store

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  # validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
