class Stock < ActiveRecord::Base
  attr_accessible :name, :ticker
  has_many :userstockinfos
  has_many :users, through: :userstockinfos

  validates :ticker,
    uniqueness: true,
    presence: true

  before_create :get_info

  def get_info
   stock = StockQuote::Stock.quote(ticker)
   self.name = stock.company
   self.ticker = stock.symbol
  end

end
