class Userstockinfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
  attr_accessible :price, :quantity, :user_id

  accepts_nested_attributes_for :stock
  attr_accessible :stock_attributes



end
