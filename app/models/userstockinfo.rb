class Userstockinfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
  attr_accessible :price, :quantity, :user_id, :stock_id

  accepts_nested_attributes_for :stock
  attr_accessible :stock_attributes


  validates :user_id, 
    presence: true
  validates :stock_id, 
    presence: true

end
