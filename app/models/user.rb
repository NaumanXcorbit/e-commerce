class User < ApplicationRecord
  has_one :store
  has_many :products
end
