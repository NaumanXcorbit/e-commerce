class Product < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :orders, through: :line_items
  has_and_belongs_to_many :categories
end
