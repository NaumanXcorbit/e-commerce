class Product < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items
  has_and_belongs_to_many :categories
  after_destroy :delete_line_items

  def delete_line_items
    self.line_items.where(product_id: self.id).delete_all
  end
end
