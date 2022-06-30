class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  after_create :send_order_detail

  def send_order_detail
    OrderMailer.send_email(self).deliver
  end
end
