require 'spec_helper'

describe Stock do
  it "can be created" do
    stock = FactoryGirl.create(:stock)
    expect(Stock.all).to include(stock)
  end

  it "received correct info" do 
    stock = Stock.create(:ticker => "aapl")
    expect(stock.ticker).to eql("AAPL")
  end

  it "get latest price" do 
    stock = Stock.create(:ticker => "aapl")
    new_price = stock.get_latest_price
    other_price = StockQuote::Stock.quote("aapl").last
    a = ""
    if ((new_price * 1.05) > other_price) && ((new_price * 0.95) < other_price) 
      a = "valid"
    end
    expect(a).to eql("valid")
  end
end
