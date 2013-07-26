class Stock < ActiveRecord::Base
  attr_accessible :name, :ticker
  has_many :userstockinfos
  has_many :users, through: :userstockinfos

  validates :ticker,
    #uniqueness: true,
    presence: true

  before_create :get_info

  def get_info
   #stock = StockQuote::Stock.quote(ticker)
   #self.name = stock.company
   #self.ticker = stock.symbol
   self.ticker = Ystock.get_stock(ticker).keys.first.to_s.upcase
  end


  def get_latest_price
    Ystock.get_stock(ticker)[ticker.to_sym][:price].to_f
  end

end
