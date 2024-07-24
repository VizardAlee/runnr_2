class Store < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  has_many :products, dependent: :destroy

  # Add validations if necessary
  validates :name, presence: true
  validates :description, presence: true
  # validates :image_url, presence: true
end
