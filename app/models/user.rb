class User < ApplicationRecord
  validates :email, presence: true
  has_one :rolify
  has_one :role, through: :rolify
  has_one :store
  has_many :orders
  has_many :products
  has_many :comments, as: :commentable
  before_validation :check_email
  after_create :user_role, :make_store
  def check_email
    if self.email.nil?
      self.email = Rails.application.credentials.email
    end
  end

  def user_role
    self.build_rolify(role_id: Role.first.id)
  end

  def make_store
    self.build_store(name: self.email.last(5)).save
  end
end
