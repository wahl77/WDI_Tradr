class Userstockinfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :stock
  attr_accessible :price, :quantity, :user_id

  accepts_nested_attributes_for :stock
  attr_accessible :stock_attributes


  def profit
    price * quantity - (quantity * self.stock.get_latest_price)
    stock.get_latest_price
  end


  def average_price
    #all = user.userstockinfos.where(:user.stock
    
  end

end
