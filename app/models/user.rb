class User < ApplicationRecord
  validates :email, presence: true
  has_one :rolify
  has_one :role, through: :rolify
  has_one :store
  has_many :orders
  has_many :products
  has_many :comments, as: :commentable
  before_validation :check_email

  def check_email
    if self.email.nil?
      self.email = Rails.application.credentials.email
    end
  end
end
