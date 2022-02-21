class Studio < ApplicationRecord
  belongs_to: :user
  validates: :name, presence: true
  validates: :address, presence: true
  validates: :description, presence: true
  validates: :price, presence: true
end
