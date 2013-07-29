require 'spec_helper'

describe User do
  it "can be created" do
    user = FactoryGirl.create(:user)
    expect(User.all).to include(user)
    expect(user.valid?).to be_true
    expect(user.cash).to eql(10000.0)
  end


  it "cash is a number" do
    user = FactoryGirl.create(:user)
    user.cash = "abc"
    expect(user.valid?).to be_false
  end


  it "can have stocks" do
    bridge = FactoryGirl.create(:userstockinfo)
    expect(bridge.user.stocks.length).to be > 0
  end

  it "can have balance" do
    bridge = FactoryGirl.create(:userstockinfo)
    expect(bridge.user.balance).to be < 10000
  end


end
