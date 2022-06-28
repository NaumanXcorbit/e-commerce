class User < ApplicationRecord
  has_one :rolify
  has_one :role, through: :rolify
  has_one :store
  has_many :products
end
