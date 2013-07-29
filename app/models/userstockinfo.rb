class Userstockinfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
  attr_accessible :price, :quantity, :user_id

  accepts_nested_attributes_for :stock
  attr_accessible :stock_attributes


  def profit
    (quantity * self.stock.get_latest_price) - price * quantity 
    #stock.get_latest_price
  end


  def average_price
    #all = user.userstockinfos.where(:user.stock
  end

end
