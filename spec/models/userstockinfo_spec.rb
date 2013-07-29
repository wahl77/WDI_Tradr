require 'spec_helper'

describe Userstockinfo do

  it "has profit" do
    bridge = FactoryGirl.create(:userstockinfo)
    expect(bridge.profit).to be_a_kind_of(Float)

    profit = bridge.quantity * bridge.stock.get_latest_price - bridge.price * bridge.quantity
    expect(((bridge.profit  - profit)/ profit).abs).to be < (0.05)


  end


end
