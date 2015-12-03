class Bid < ActiveRecord::Base
  validates :amount, presence: true
  
  belongs_to :product
  belongs_to :user
end
